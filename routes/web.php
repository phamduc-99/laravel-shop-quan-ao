<?php

use Illuminate\Support\Facades\Route;
use Illuminate\Support\Facades\Schema;
use Illuminate\Support\Facades\DB;
/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/


Route::get('/', function () {
    return view('backend.index');
});

// Frontend Route

Route::group(['prefix' => '/', 'namespace' =>'Site'], function() {
    
    Route::group(['prefix' => 'san-pham','namespace' => 'Products'], function() {
        Route::get('/', 'ProductController@shop')->name('shop');
        Route::get('/{slug}.html', 'ProductController@detail')->name('shop.detail');
        Route::get('/tim-kiem', 'ProductController@filter')->name('shop.filter');
    });
    Route::group(['prefix' => 'danh-muc','namespace' => 'Category'], function() {
        Route::get('{cate_slug}.html', 'CategoryController@index')->name('cate.index');
    });

    Route::group(['prefix' => 'gio-hang','namespace'=>'Cart'], function() {
        Route::get('/', 'CartController@cart')->name('cart');
        Route::get('/them-gio-hang', 'CartController@addToCart')->name('cart.add');
        Route::get('/thanh-toan.html', 'CartController@checkout')->name('cart.checkout');
        Route::post('/thanh-toan', 'CartController@payment')->name('cart.payment');
        Route::get('/hoan-thanh.html', 'CartController@complete')->name('cart.complete');
        Route::get('/cap-nhat-gio-hang/{rowId}/{qty}','CartController@update')->name('cart.update');
        Route::get('/xoa-san-pham/{rowId}','CartController@delete')->name('cart.delete');
        
    });

    Route::get('/lien-he.html', 'SiteController@contact')->name('contact');
    Route::get('/ve-chung-toi.html', 'SiteController@about')->name('about');
    Route::get('/', 'SiteController@index')->name('index');
    
});



// Backend Route

Route::get('/login','Admin\Auth\LoginController@login')->name('login')->middleware('CheckLogout');
Route::post('/login','Admin\Auth\LoginController@postLogin');


Route::group(['prefix'=>'admin','namespace' => 'Admin','middleware'=>'CheckLogin'], function() {
    Route::get('/logout','AdminController@logout')->name('logout');
    Route::get('/', 'AdminController@index')->name('dashboard');
    Route::group(['prefix' => 'user','namespace' => 'User'], function() {
        Route::get('/', 'UserController@index')->name('user.index');
        Route::get('/detail/{id}', 'UserController@detail')->name('user.detail');
        Route::get('/create', 'UserController@create')->name('user.create');
        Route::post('/store', 'UserController@store')->name('user.store');
        Route::get('/edit/{id}', 'UserController@edit')->name('user.edit');
        Route::post('/update/{id}', 'UserController@update')->name('user.update');
        Route::get('/delete/{id}', 'UserController@delete')->name('user.delete');
    });
    Route::group(['prefix' => 'product','namespace' => 'Products'], function() {
        Route::get('/', 'ProductController@index')->name('product.index');
        Route::get('/create', 'ProductController@create')->name('product.create');
        Route::post('/store', 'ProductController@store')->name('product.store');
        Route::get('/edit/{id}', 'ProductController@edit')->name('product.edit');
        Route::post('/update/{id}', 'ProductController@update')->name('product.update');
        Route::get('/delete/{id}', 'ProductController@delete')->name('product.delete');
    });
    // Category
    Route::group(['prefix' => 'category','namespace' => 'Category'], function() {
        Route::get('/', 'CategoryController@index')->name('category.index');
        Route::get('/detail/{id}', 'CategoryController@detail')->name('category.detail');
        Route::post('/store', 'CategoryController@store')->name('category.store');
        Route::get('/edit/{id}', 'CategoryController@edit')->name('category.edit');
        Route::post('/update/{id}', 'CategoryController@update')->name('category.update');
        Route::get('/delete/{id}', 'CategoryController@delete')->name('category.delete');
    });
    Route::group(['prefix' => 'order','namespace' => 'Order'], function() {
        Route::get('/', 'OrderController@orders')->name('order.order');
        Route::get('/detail/{orderId}', 'OrderController@detail')->name('order.detail');
        Route::get('/approved/{orderId}', 'OrderController@approve')->name('order.approved');
        Route::get('/processed', 'OrderController@processed')->name('order.processed');
    });
});

