{{-- resources/views/products/show.blade.php --}}
@extends('layouts.app')

@section('title', $product->name)

@section('content')
<div class="container">
    <div class="row">
        <div class="col-md-8">
            <nav aria-label="breadcrumb">
                <ol class="breadcrumb">
                    <li class="breadcrumb-item"><a href="{{ route('home') }}">Home</a></li>
                    <li class="breadcrumb-item"><a href="{{ route('products.index') }}">Products</a></li>
                    <li class="breadcrumb-item active" aria-current="page">{{ $product->name }}</li>
                </ol>
            </nav>

            <h1>{{ $product->name }}</h1>
            <p class="lead">${{ number_format($product->price, 2) }}</p>

            <div class="mb-4">
                <p><strong>Description:</strong></p>
                <p>{{ $product->description }}</p>
            </div>

            <div class="mb-4">
                <p><strong>Availability:</strong>
                    @if($product->stock_quantity > 0)
                        <span class="text-success">In Stock ({{ $product->stock_quantity }} available)</span>
                    @else
                        <span class="text-danger">Out of Stock</span>
                    @endif
                </p>
            </div>

            @auth
                @if($product->stock_quantity > 0)
                <form action="{{ route('cart.store') }}" method="POST" class="row g-3 align-items-center">
                    @csrf
                    <input type="hidden" name="product_id" value="{{ $product->id }}">
                    <div class="col-auto">
                        <label for="quantity" class="col-form-label">Quantity:</label>
                    </div>
                    <div class="col-auto">
                        <input type="number" class="form-control" id="quantity" name="quantity"
                               value="1" min="1" max="{{ $product->stock_quantity }}">
                    </div>
                    <div class="col-auto">
                        <button type="submit" class="btn btn-primary btn-lg">
                            <i class="fas fa-cart-plus"></i> Add to Cart
                        </button>
                    </div>
                </form>
                @endif
            @else
                <div class="alert alert-info">
                    Please <a href="{{ route('login') }}">login</a> to add this product to your cart.
                </div>
            @endauth

            <div class="mt-4">
                <a href="{{ route('products.index') }}" class="btn btn-secondary">
                    <i class="fas fa-arrow-left"></i> Back to Products
                </a>
            </div>
        </div>
    </div>
</div>
@endsection
