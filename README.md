# 📸 Instagram Clone Database (MySQL Project)

## 🚀 Project Overview

This project is a **MySQL-based Instagram Clone Database** designed to simulate real-world social media data and perform business-driven analysis.

It helps in solving practical business problems using SQL, such as:

* Identifying loyal users
* Re-engaging inactive users
* Analyzing user registration trends
* Understanding user engagement patterns

---

## 🗂️ Database Schema

The project includes the following tables:

* **users** – stores user information
* **photos** – stores uploaded photos
* **comments** – user comments on photos
* **likes** – user likes on photos
* **follows** – follower-following relationships
* **tags** – hashtags
* **photo_tags** – mapping between photos and tags

---

## 📊 Business Problems Solved

### ✅ 1. Loyal Users Reward System

Identify users who are highly active (likes, comments, posts).

### ✅ 2. User Registration Trends

Find which days have the highest number of user registrations.

### ✅ 3. Inactive Users

Detect users who:

* Never posted
* Never commented
* Not engaged with platform

### ✅ 4. Celebrity Users

Users who:

* Comment on every photo
* Or never comment at all

### ✅ 5. Engagement Analysis

* Most liked photos
* Most used hashtags
* Most followed users

---

## 🧠 Key SQL Concepts Used

* Joins (`INNER JOIN`, `LEFT JOIN`)
* Aggregations (`COUNT`, `AVG`)
* Subqueries
* `GROUP BY` & `HAVING`
* `CASE` statements
* `NOT EXISTS`
* Window functions (if used)

---

## 🛠️ Tools Used

* MySQL Workbench
* SQL (Structured Query Language)

---

## 📁 Project Structure

```
📦 instagram-clone-sql
 ┣ 📜 schema.sql
 ┣ 📜 queries.sql
 ┣ 📜 README.md
```

---

## ▶️ How to Run the Project

1. Open MySQL Workbench
2. Create a new database:

   ```sql
   CREATE DATABASE instagram_clone;
   USE instagram_clone;
   ```
3. Run the schema file
4. Run the queries file to perform analysis

---

## 📈 Sample Insights

* Identified top 5 most loyal users
* Found peak registration day for marketing campaigns
* Detected inactive users for re-engagement strategies

---

## 🌟 Future Improvements

* Add Power BI / Tableau dashboard
* Include stored procedures
* Add indexing for performance optimization

---

## 🤝 Contributing

Feel free to fork this repo and improve queries or add new analysis!

---

## 📬 Contact

**Sumit Raut**
📍 Nagpur, India
💼 Open to Data Analyst / SQL Developer roles
