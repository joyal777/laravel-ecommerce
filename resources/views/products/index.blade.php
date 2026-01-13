
@extends('layouts.app')

@section('title', 'Products')

@section('content')
<div class="container">
    <div class="row mb-4">
        <div class="col-md-12">
            <h1>Products</h1>

            <!-- Filters -->
            <form method="GET" action="{{ route('products.index') }}" class="row g-3">
                <div class="col-md-3">
                    <label for="min_price" class="form-label">Min Price</label>
                    <input type="number" class="form-control" id="min_price" name="min_price"
                           value="{{ request('min_price') }}" placeholder="0.00" step="0.01" required>
                </div>
                <div class="col-md-3">
                    <label for="max_price" class="form-label">Max Price</label>
                    <input type="number" class="form-control" id="max_price" name="max_price"
                           value="{{ request('max_price') }}" placeholder="1000.00" step="0.01" required>
                </div>
                <div class="col-md-3">
                    <div class="form-check mt-4">
                        <input class="form-check-input" type="checkbox" id="in_stock" name="in_stock"
                               value="1" {{ request('in_stock') ? 'checked' : '' }}>
                        <label class="form-check-label" for="in_stock">
                            In Stock Only
                        </label>
                    </div>
                </div>
                <div class="col-md-3 mt-4">
                    <button type="submit" class="btn btn-primary">Filter</button>
                    <a href="{{ route('products.index') }}" class="btn btn-secondary">Clear</a>
                </div>
            </form>
        </div>
    </div>

    <div class="row">
        @forelse($products as $product)
        <div class="col-md-4 mb-4">
            <div class="card h-100">
                <div class="card-body">
                    <h5 class="card-title">{{ $product->name }}</h5>
                    <p class="card-text">{{ Str::limit($product->description, 100) }}</p>
                    <p class="card-text">
                        <strong>${{ number_format($product->price, 2) }}</strong>
                        <br>
                        @if($product->stock_quantity > 0)
                            <span class="badge bg-success">In Stock ({{ $product->stock_quantity }})</span>
                        @else
                            <span class="badge bg-danger">Out of Stock</span>
                        @endif
                    </p>
                    <a href="{{ route('products.show', $product) }}" class="btn btn-outline-primary">View Details</a>

                    @auth
                        @if($product->stock_quantity > 0)
                        <form action="{{ route('cart.store') }}" method="POST" class="d-inline">
                            @csrf
                            <input type="hidden" name="product_id" value="{{ $product->id }}">
                            <input type="number" name="quantity" value="1" min="1" max="{{ $product->stock_quantity }}"
                                   class="form-control d-inline" style="width: 70px;">
                            <button type="submit" class="btn btn-primary mt-2">Add to Cart</button>
                        </form>
                        @endif
                    @endauth
                </div>
            </div>
        </div>
        @empty
        <div class="col-md-12">
            <div class="alert alert-info">
                No products found.
                @if(Auth::check() && Auth::user()->isAdmin())
                    <a href="{{ route('products.create') }}">Add some products</a>
                @endif
            </div>
        </div>
        @endforelse
    </div>

    <div class="d-flex justify-content-center">
        {{ $products->links() }}
    </div>
</div>
@endsection
