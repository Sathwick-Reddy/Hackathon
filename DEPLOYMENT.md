# LearnInfinity Deployment Guide

This document provides instructions for deploying the LearnInfinity application to production.

## Prerequisites

- Docker and Docker Compose installed
- MongoDB Atlas account or MongoDB instance
- Node.js 18+ (for local development)
- Git

## Environment Configuration

1. Copy the `.env.example` file to `.env`:
   ```bash
   cp .env.example .env
   ```

2. Update the environment variables in `.env`:
   - `MONGODB_URI`: Your MongoDB connection string
   - `JWT_SECRET`: A strong secret key for JWT tokens
   - `FRONTEND_URL`: Your frontend domain (e.g., https://yourdomain.com)

## Deployment Options

### Option 1: Docker Compose (Recommended)

1. Ensure your `.env` file is properly configured

2. Run the application with Docker Compose:
   ```bash
   docker-compose up -d
   ```

3. The application will be available at `http://localhost:5000`

### Option 2: Manual Deployment

1. Install dependencies:
   ```bash
   npm install
   cd client && npm install
   ```

2. Build the client application:
   ```bash
   cd client && npm run build
   ```

3. Start the server:
   ```bash
   npm start
   ```

### Option 3: Production with Nginx

1. Build the Docker image:
   ```bash
   docker build -t learninfinity .
   ```

2. Run with Nginx reverse proxy:
   ```bash
   docker-compose -f docker-compose.yml -f nginx-compose.yml up -d
   ```

## Production Considerations

### Security
- Change the default JWT secret in production
- Use HTTPS in production
- Set proper CORS settings for your domain
- Regularly update dependencies

### Database
- Use a production-ready MongoDB instance
- Implement proper backup strategies
- Monitor database performance

### Performance
- Enable gzip compression
- Set up proper caching headers
- Monitor application performance
- Implement CDN for static assets

## Environment Variables

| Variable | Description | Default |
|----------|-------------|---------|
| `MONGODB_URI` | MongoDB connection string | - (required) |
| `JWT_SECRET` | Secret key for JWT tokens | - (required) |
| `PORT` | Server port | 5000 |
| `NODE_ENV` | Environment mode | production |
| `FRONTEND_URL` | Frontend domain | - (recommended) |

## Docker Compose Services

The application consists of two main services:

1. **app**: The Node.js/Express backend server
2. **mongodb**: MongoDB database instance

### Volumes

- `mongodb_data`: Persistent storage for MongoDB data

### Networks

- `learninfinity-network`: Internal network for service communication

## Nginx Configuration

The nginx configuration provides:

- Reverse proxy to the backend server
- Static file serving for React build
- Gzip compression
- Security headers
- Proper caching headers
- API route handling

## Health Checks

- API health check: `/api/health`
- Server status: `/api`

## Troubleshooting

### Common Issues

1. **Database Connection Issues**:
   - Verify your MongoDB URI is correct
   - Check that your database is accessible
   - Ensure proper network connectivity

2. **Build Issues**:
   - Ensure all dependencies are installed
   - Check that environment variables are set correctly

3. **Docker Issues**:
   - Verify Docker is running
   - Check Docker logs: `docker-compose logs`
   - Ensure sufficient system resources

### Useful Commands

```bash
# View logs
docker-compose logs -f

# Stop services
docker-compose down

# Restart services
docker-compose restart

# Check running containers
docker-compose ps
```

## Scaling

For production deployments, consider:

- Load balancing with multiple app instances
- Database replica sets
- CDN for static assets
- Monitoring and alerting
- Automated backups