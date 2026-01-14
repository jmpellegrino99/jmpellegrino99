from rapidfuzz import fuzz, process

products = [
"iPhone 15 Pro",
"iPhone 15 Pro Max",
"Samsung Galaxy S23"
]

query = "iphone 15 pro"

match, score, index = process.extractOne(query, products)

print(match)
