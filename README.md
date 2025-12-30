# LearnInfinity

SkillSwap - Trade Skills, Not Cash

## About

LearnInfinity is a credit-based skill sharing platform where users can trade skills without monetary exchange. Users earn credits by teaching others and spend credits to learn from others.

## Features

- Credit-based system for skill exchange
- User authentication and profiles
- Skill management (offering and learning)
- Session tracking and credit deduction
- Instructor profiles and skill browsing

## Tech Stack

- Frontend: React 18
- Backend: Node.js + Express.js
- Database: MongoDB
- Authentication: JWT
- Styling: CSS

## Deployment

### Heroku Deployment (Free Tier)

1. Create a free Heroku account at [heroku.com](https://heroku.com)
2. Install Heroku CLI
3. Create a new app in your Heroku dashboard
4. Add MongoDB Atlas addon or connect to MongoDB Atlas free cluster
5. Set environment variables:
   - `MONGODB_URI`: Your MongoDB connection string
   - `JWT_SECRET`: A strong secret key
   - `NODE_ENV`: production
6. Deploy using Git:
   ```bash
   heroku git:remote -a your-app-name
   git add .
   git commit -m "Deploy to Heroku"
   git push heroku main
   ```

### Cyclic.sh Deployment (Free Tier)

1. Go to [cyclic.sh](https://cyclic.sh)
2. Connect your GitHub repository
3. Cyclic will automatically detect and deploy your Node.js app
4. Add your environment variables in the dashboard
5. Connect to MongoDB Atlas for the database

### Railway Deployment (Free Tier)

1. Go to [railway.app](https://railway.app)
2. Import your GitHub repository
3. Set environment variables in the dashboard
4. Deploy with one click

## Environment Variables

Create a `.env` file with the following variables:

```
MONGODB_URI=your_mongodb_connection_string
JWT_SECRET=your_super_secret_jwt_key
NODE_ENV=production
PORT=5000
```

## Local Development

1. Clone the repository
2. Install dependencies:
   ```bash
   npm install
   cd client && npm install
   ```
3. Create a `.env` file with your environment variables
4. Run the development server:
   ```bash
   npm run dev
   ```

## Database Setup

This application requires MongoDB. For production, use MongoDB Atlas:

1. Create a free account at [MongoDB Atlas](https://www.mongodb.com/atlas)
2. Create a new cluster
3. Create a database user
4. Add your IP address to the access list
5. Get the connection string and add it to your environment variables

## Project Structure

```
.
├── client/               # React frontend
│   ├── public/
│   ├── src/
│   │   ├── components/   # React components
│   │   ├── pages/        # Page components
│   │   ├── services/     # API services
│   │   └── context/      # React context
│   └── package.json
├── models/               # MongoDB models
├── routes/               # API routes
├── server.js             # Express server
├── package.json          # Backend dependencies
└── README.md
```

## API Endpoints

- `POST /api/auth/register` - User registration
- `POST /api/auth/login` - User login
- `GET /api/auth/me` - Get current user
- `PUT /api/auth/profile` - Update profile
- `POST /api/auth/skills` - Add skill
- `DELETE /api/auth/skills/:type/:index` - Remove skill
- `POST /api/auth/deduct-credit` - Deduct credit
- `POST /api/auth/add-credit` - Add credit
- `GET /api/health` - Health check

## Credits System

- New users receive 24 free credits
- 1 credit is deducted per hour of learning
- 1 credit is earned per hour of teaching
- Credits enable a balanced skill exchange ecosystem

## Contributing

1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Add tests if applicable
5. Submit a pull request

## License

This project is licensed under the MIT License.