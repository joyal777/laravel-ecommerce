{{-- resources/views/home.blade.php --}}
@extends('layouts.app')

@section('content')
<div class="container">
    @if(session('success'))
        <div class="alert alert-success alert-dismissible fade show" role="alert">
            {{ session('success') }}
            <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
        </div>
    @endif

    <div class="py-5 text-center">
        <h1>Welcome to Laravel E-commerce</h1>
        <p class="lead">Browse our collection of amazing products</p>
    </div>

    <div class="row">
        @foreach($products as $product)
        <div class="col-md-3 mb-4">
            <div class="card h-100">
                <div class="card-body">
                    <h5 class="card-title">{{ $product->name }}</h5>
                    <p class="card-text">{{ Str::limit($product->description, 100) }}</p>
                    <p class="card-text">
                        <strong>${{ number_format($product->price, 2) }}</strong>
                        @if($product->stock_quantity > 0)
                            <span class="badge bg-success">In Stock</span>
                        @else
                            <span class="badge bg-danger">Out of Stock</span>
                        @endif
                    </p>
                    <a href="{{ route('products.show', $product) }}" class="btn btn-outline-primary">View Details</a>
                </div>
            </div>
        </div>
        @endforeach
    </div>

    <div class="text-center mt-4">
        <a href="{{ route('products.index') }}" class="btn btn-primary btn-lg">View All Products</a>
    </div>
</div>
@endsection
