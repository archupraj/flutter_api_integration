
# flutter_api_integration

A Flutter application that fetches products from a public API and displays them in a clean and responsive UI. The app demonstrates API integration, JSON parsing, state handling, and modern UI practices.

## 🚀 Features

* Fetch product data from REST API
* Display product image, title, and price
* Scrollable product list
* Grid view and list view toggle
* Shimmer loading effect while fetching data
* Pull-to-refresh functionality
* Cached network images for better performance
* Product details screen
* Error handling for API failures
* Clean and modular code structure

---

## 📡 API Used

```
https://fakestoreapi.com/products
```

The API returns a list of products with fields such as:

* id
* title
* price
* description
* image

---

## 📱 Screens

### Product List Screen

Displays products in a scrollable list or grid layout.

Each item shows:

* Product image
* Product title
* Product price

### Product Detail Screen

Shows full product information including:

* Large product image
* Product title
* Product price
* Product description

---

## 📦 Dependencies

The project uses the following Flutter packages:

```yaml
http
cached_network_image
shimmer
```

---

## 📂 Project Structure

```
lib
│
├── main.dart
│
├── models
│   └── product_model.dart
│
├── services
│   └── api_service.dart
│
├── screens
│   ├── product_list_screen.dart
│   └── product_detail_screen.dart
│
├── widgets
│   ├── product_card.dart
│   └── shimmer_loading.dart
```
