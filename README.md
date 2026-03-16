# 🎥 Movie Recommendation System

A web-based movie recommendation system that leverages MySQL for data storage and retrieval, providing personalized movie suggestions based on user preferences and ratings.

## 📋 About the Project

This project is a full-stack movie recommendation application that allows users to explore movies, rate them, and receive personalized recommendations. It uses a MySQL database to store movie data, user ratings, and watch history, with stored procedures and triggers for efficient data management.

## ✨ Features

- 🎬 **Movie Database**: Comprehensive collection of movies with genres, ratings, and details
- ⭐ **User Ratings**: Rate movies and track personal watch history
- 🔍 **Search & Filter**: Find movies by genre, rating, or popularity
- 📊 **Analytics**: View top-rated movies, trending films, and genre-based recommendations
- 🔄 **Automated Updates**: Database triggers for automatic watch history insertion and rating updates
- 📈 **Performance Optimized**: Indexes and stored procedures for fast queries

## 🛠️ Technologies Used

- **Backend**: Node.js, Express.js
- **Database**: MySQL
- **Frontend**: HTML, CSS, JavaScript
- **Database Tools**: MySQL Workbench (for ERD design)
- **Version Control**: Git

## 📁 Project Structure

```
Movie-Recommendation MySQL/
├── app/
│   ├── package.json          # Node.js dependencies
│   ├── server.js             # Express server setup
│   └── public/
│       ├── app.js            # Frontend JavaScript
│       ├── index.html        # Main HTML page
│       └── style.css         # Styling
└── SQL/
    ├── bulk_insert.sql       # Sample data insertion
    ├── create_db.sql         # Database creation
    ├── create_index.sql      # Database indexes
    ├── create_tables.sql     # Table definitions
    ├── ERD.mwb               # Entity-Relationship Diagram
    ├── recommend_movies_queries.sql  # Recommendation queries
    ├── stored_procedures/    # Database procedures
    │   ├── GetAverageRatingByGenre.sql
    │   ├── GetHighlyRatedMoviesByGenre.sql
    │   ├── GetMoviesByGenre.sql
    │   ├── GetMoviesRatedByMostUsers.sql
    │   ├── GetTopRatedMovies.sql
    │   └── GetTrendingMovies.sql
    └── triggers/             # Database triggers
        ├── auto_insert_watch_history.sql
        ├── trigger_eg_1.sql
        ├── trigger_eg_2.sql
        └── update_movie_rating.sql
```

## 🚀 How to Run

### Prerequisites
- Node.js (v14 or higher)
- MySQL Server
- Git

### Setup Instructions

1. **Clone the repository**
   ```bash
   git clone <repository-url>
   cd Movie-Recommendation MySQL
   ```

2. **Set up the database**
   - Install MySQL and create a database
   - Run the SQL scripts in order:
     ```sql
     -- In MySQL command line or workbench
     source SQL/create_db.sql;
     source SQL/create_tables.sql;
     source SQL/create_index.sql;
     source SQL/bulk_insert.sql;
     ```

3. **Install dependencies**
   ```bash
   cd app
   npm install
   ```

4. **Configure database connection**
   - Update database credentials in `server.js` if needed

5. **Start the server**
   ```bash
   npm start
   ```

6. **Open in browser**
   - Navigate to `http://localhost:3000` (or configured port)

## 🎯 Skills Demonstrated

- **Database Design**: ERD creation, normalization, indexing
- **SQL Development**: Complex queries, stored procedures, triggers
- **Backend Development**: RESTful API with Node.js/Express
- **Frontend Development**: Responsive web design with vanilla JS
- **Database Administration**: MySQL management and optimization
- **Full-Stack Integration**: Connecting frontend to database via backend

## Video Demo

https://github.com/user-attachments/assets/fa40b581-03c5-4930-bba0-43f7f1ff2341



