# Solar Secure - Node Project

A simple food-ordering demo application built with Node.js, Express, EJS templates and MySQL. It provides a categorized menu, product pages, a session-based shopping cart, and a basic checkout flow.

## Features

- Menu listing with category filters and search
- Product detail pages and product listing pages
- Add to cart, remove from cart, and update quantity (session-based)
- Cart total calculation and order placement persisted to MySQL
- Responsive UI using Bootstrap and small client-side scripts

## Tech Stack

- Node.js
- Express
- EJS templates
- MySQL
- Bootstrap, jQuery
- express-session, body-parser

## Prerequisites

- Node.js (v14+ recommended)
- npm
- MySQL server

## Setup

1. Clone the repo or copy the project files to your machine.

2. Install dependencies:

```bash
cd "d:\My Projects\Solar secure lets intern project\node_project"
npm install
```

3. Configure the database connection in `index.js` or use environment variables (recommended). Example DB config in `index.js`:

```js
var con = mysql.createConnection({
  host: "localhost",
  user: "root",
  password: "",
  database: "node_project"
})
```

Create the `products` and `orders` tables in your MySQL instance and populate `products` with sample data before running the app.

## Environment variables (recommended)

Instead of hardcoding credentials, create a `.env` file and use `process.env` in `index.js`. Add `.env` to `.gitignore`.

Example `.env`:

```
DB_HOST=localhost
DB_USER=root
DB_PASS=
DB_NAME=node_project
SESSION_SECRET=your-secret
```

## Run the app

Start the server:

```bash
node index.js
# or with nodemon
npx nodemon index.js
```

Open http://localhost:5000 in your browser (or the port printed in the console).

## Database notes

- The app expects a `products` table with columns like `id`, `name`, `description`, `price`, `sale_price`, `image` (adjust as needed).
- Orders are stored in an `orders` table when a user places an order.

## Git & Deployment

1. Initialize git and push to GitHub:

```bash
git init
git add .
git commit -m "Initial commit"
git remote add origin https://github.com/<your-username>/<repo>.git
git branch -M main
git push -u origin main
```

2. Deploy providers:

- Render / Railway / Heroku / Azure App Service — connect your GitHub repo, set build & start commands to `npm install` and `npm start`, and configure environment variables and a managed MySQL instance.

- For Heroku, add a `Procfile` with:

```
web: node index.js
```

## package.json

Make sure `package.json` includes a `start` script:

```json
"scripts": {
  "start": "node index.js"
}
```

## Removing Template Attribution

I removed the `All Rights Reserved By Free Html Templates` footer lines from the EJS templates in the `views/pages` directory.

## Next steps (optional)

- Move DB credentials to environment variables and update `index.js`.
- Add migrations or a SQL seed file to create `products` and `orders` tables.
- Add authentication for order management.
- Improve frontend accessibility and add unit/integration tests.

---

If you want, I can also:
- add a `start` script to `package.json`,
- create a `.env.example` file, or
- add a GitHub Actions workflow to automatically deploy to a provider.
