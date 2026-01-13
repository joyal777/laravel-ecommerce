<?php

namespace App\Http\Controllers;

use App\Models\Order;
use App\Models\OrderItem;
use App\Models\Cart;
use App\Models\Product;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Mail;
use App\Mail\OrderConfirmation;

class OrderController extends Controller
{
    public function index()
    {
        $orders = Auth::user()->orders()->with('items.product')->latest()->get();
        return view('orders.index', compact('orders'));
    }

    public function store()
    {
        $user = Auth::user();
        $cartItems = $user->carts()->with('product')->get();

        if ($cartItems->isEmpty()) {
            return back()->with('error', 'Your cart is empty.');
        }

        // Validate stock and calculate total
        $total = 0;
        foreach ($cartItems as $cartItem) {
            if ($cartItem->product->stock_quantity < $cartItem->quantity) {
                return back()->with('error',
                    "Insufficient stock for {$cartItem->product->name}. Only {$cartItem->product->stock_quantity} available.");
            }
            $total += $cartItem->product->price * $cartItem->quantity;
        }

        // Create order
        $order = Order::create([
            'user_id' => $user->id,
            'total_amount' => $total,
            'status' => 'pending',
        ]);

        // Create order items and update stock
        foreach ($cartItems as $cartItem) {
            OrderItem::create([
                'order_id' => $order->id,
                'product_id' => $cartItem->product_id,
                'quantity' => $cartItem->quantity,
                'price' => $cartItem->product->price,
            ]);

            // Update product stock
            $product = Product::find($cartItem->product_id);
            $product->stock_quantity -= $cartItem->quantity;
            $product->save();
        }

        // Clear cart
        $user->carts()->delete();

        // Send confirmation email
        Mail::to($user->email)->send(new OrderConfirmation($order));

        return redirect()->route('orders.index')
            ->with('success', 'Order placed successfully. Confirmation email sent.');
    }

    public function show(Order $order)
    {
        if ($order->user_id !== Auth::id()) {
            abort(403);
        }

        return view('orders.show', compact('order'));
    }
}
