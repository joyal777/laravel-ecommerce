{{-- resources/views/cart/index.blade.php --}}
@extends('layouts.app')

@section('title', 'Shopping Cart')

@section('content')
<div class="container">
    <h1>Shopping Cart</h1>

    @if(session('success'))
        <div class="alert alert-success alert-dismissible fade show" role="alert">
            {{ session('success') }}
            <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
        </div>
    @endif

    @if(session('error'))
        <div class="alert alert-danger alert-dismissible fade show" role="alert">
            {{ session('error') }}
            <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
        </div>
    @endif

    @if($cartItems->count() > 0)
    <div class="table-responsive">
        <table class="table table-bordered">
            <thead>
                <tr>
                    <th>Product</th>
                    <th>Price</th>
                    <th>Quantity</th>
                    <th>Total</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                @foreach($cartItems as $item)
                <tr>
                    <td>
                        <div class="d-flex align-items-center">
                            <div>
                                <h6 class="mb-0">{{ $item->product->name }}</h6>
                                <p class="mb-0 text-muted">{{ Str::limit($item->product->description, 50) }}</p>
                            </div>
                        </div>
                    </td>
                    <td>${{ number_format($item->product->price, 2) }}</td>
                    <td>
                        <form action="{{ route('cart.update', $item) }}" method="POST" class="d-inline">
                            @csrf
                            @method('PUT')
                            <input type="number" name="quantity" value="{{ $item->quantity }}"
                                   min="1" max="{{ $item->product->stock_quantity }}"
                                   class="form-control" style="width: 80px;" onchange="this.form.submit()">
                        </form>
                    </td>
                    <td>${{ number_format($item->product->price * $item->quantity, 2) }}</td>
                    <td>
                        <form action="{{ route('cart.destroy', $item) }}" method="POST" class="d-inline">
                            @csrf
                            @method('DELETE')
                            <button type="submit" class="btn btn-danger btn-sm">
                                <i class="fas fa-trash"></i> Remove
                            </button>
                        </form>
                    </td>
                </tr>
                @endforeach
            </tbody>
            <tfoot>
                <tr>
                    <td colspan="3" class="text-end"><strong>Grand Total</strong></td>
                    <td><strong>${{ number_format($total, 2) }}</strong></td>
                    <td></td>
                </tr>
            </tfoot>
        </table>
    </div>

    <div class="d-flex justify-content-between">
        <a href="{{ route('products.index') }}" class="btn btn-secondary">Continue Shopping</a>
        <form action="{{ route('orders.store') }}" method="POST">
            @csrf
            <button type="submit" class="btn btn-primary btn-lg">Proceed to Checkout</button>
        </form>
    </div>
    @else
    <div class="alert alert-info">
        Your cart is empty. <a href="{{ route('products.index') }}">Browse products</a>
    </div>
    @endif
</div>
@endsection
