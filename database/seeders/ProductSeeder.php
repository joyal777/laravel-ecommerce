<?php

namespace Database\Seeders;

use App\Models\Product;
use Illuminate\Database\Seeder;

class ProductSeeder extends Seeder
{
    public function run()
    {
        $products = [
            [
                'name' => 'Laptop',
                'description' => 'A powerful laptop for all your needs.',
                'price' => 999.99,
                'stock_quantity' => 10,
            ],
            [
                'name' => 'Smartphone',
                'description' => 'Latest smartphone with amazing features.',
                'price' => 699.99,
                'stock_quantity' => 25,
            ],
            [
                'name' => 'Headphones',
                'description' => 'Noise-cancelling headphones.',
                'price' => 199.99,
                'stock_quantity' => 50,
            ],
            [
                'name' => 'Keyboard',
                'description' => 'Mechanical keyboard for gamers.',
                'price' => 89.99,
                'stock_quantity' => 30,
            ],
            [
                'name' => 'Mouse',
                'description' => 'Wireless mouse with high precision.',
                'price' => 49.99,
                'stock_quantity' => 40,
            ],
        ];

        foreach ($products as $product) {
            Product::create($product);
        }

        // Generate more products using factory
        Product::factory(20)->create();
    }
}
