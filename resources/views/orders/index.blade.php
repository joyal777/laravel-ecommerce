{{-- resources/views/orders/index.blade.php --}}
@extends('layouts.app')

@section('title', 'My Orders')

@section('content')
<div class="container">
    <h1>My Orders</h1>

    @if(session('success'))
        <div class="alert alert-success alert-dismissible fade show" role="alert">
            {{ session('success') }}
            <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
        </div>
    @endif

    @if($orders->count() > 0)
    <div class="table-responsive">
        <table class="table table-bordered">
            <thead>
                <tr>
                    <th>Order ID</th>
                    <th>Date</th>
                    <th>Total Amount</th>
                    <th>Status</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                @foreach($orders as $order)
                <tr>
                    <td>#{{ str_pad($order->id, 8, '0', STR_PAD_LEFT) }}</td>
                    <td>{{ $order->created_at->format('M d, Y h:i A') }}</td>
                    <td>${{ number_format($order->total_amount, 2) }}</td>
                    <td>
                        <span class="badge
                            @if($order->status == 'completed') bg-success
                            @elseif($order->status == 'processing') bg-warning
                            @elseif($order->status == 'pending') bg-info
                            @else bg-danger
                            @endif">
                            {{ ucfirst($order->status) }}
                        </span>
                    </td>
                    <td>
                        <a href="{{ route('orders.show', $order) }}" class="btn btn-primary btn-sm">View Details</a>
                    </td>
                </tr>
                @endforeach
            </tbody>
        </table>
    </div>
    @else
    <div class="alert alert-info">
        You have not placed any orders yet. <a href="{{ route('products.index') }}">Browse products</a>
    </div>
    @endif
</div>
@endsection
