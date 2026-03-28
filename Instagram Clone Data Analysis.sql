/*We want to reward our users who have been around the longest.
  Find the 5 oldest users.*/
  
  SELECT * FROM users
  ORDER BY created_at DESC
  LIMIT 5;
  
/*What day of the week do most users register on?
We need to figure out when to schedule an ad campgain*/
SELECT date_format(created_at, '%W') AS 'Day_of_the_week',COUNT(*) AS 'Total_registration'
FROM users
GROUP BY 1
ORDER BY 2 DESC
LIMIT 5 ;

/*version 2*/
SELECT dayname(created_at) AS Day, 
COUNT(*) AS Total
FROM users 
GROUP BY Day
ORDER BY Total DESC
LIMIT 2;

/*We want to target our inactive users with an email campaign.
Find the users who have never posted a photo*/
SELECT username
FROM users
LEFT JOIN photos ON users.id = photos.user_id
WHERE photos.id IS NULL;

/*We're running a new contest to see who can get the most likes on a single photo.
WHO WON??!!*/
SELECT username,photos.id,photos.image_url, COUNT(*) AS total
FROM photos
INNER JOIN likes ON likes.photo_id = photos.id
INNER JOIN users ON photos.user_id = users.id
GROUP BY photos.id
ORDER BY total DESC
LIMIT 1;

/*Our Investors want to know...
How many times does the average user post?*/
/*total number of photos/total number of users*/
SELECT ROUND((SELECT COUNT(*) FROM photos)/(SELECT COUNT(*)FROM users), 2) AS AVG_User_Post;

/*user ranking by postings higher to lower*/
SELECT users.username, COUNT(photos.image_url)
From users
JOIN photos ON users.id=photos.user_id
GROUP BY users.id
ORDER BY 2 DESC;

/*Total Posts by users (longer version of SELECT COUNT(*)FROM photos) */
SELECT SUM(user_posts.total_post_per_user)
FROM (SELECT users.username, COUNT(photos.image_url) AS total_post_per_user
		From Users
        JOIN photos ON users.id=photos.user_id
        GROUP BY users.id) AS user_posts;

/*total numbers of users who have posted at least one time */
SELECT COUNT(DISTINCT(user_id)) AS total_no_of_users_with_posts
FROM users
JOIN photos ON users.id=photos.user_id;

/*A brand wants to know which hashtags to use in a post
What are the top 5 most commonly used hashtags?*/
SELECT tag_name, COUNT(tag_name) AS Total
FROM tags
JOIN photo_tags ON tags.id=photo_tags.tag_id
GROUP BY tags.id
ORDER BY Total DESC;

/*We have a small problem with bots on our site...
Find users who have liked every single photo on the site*/
SELECT users.id, username, COUNT(users.id) AS Total_likes_by_user
FROM users
JOIN likes ON users.id=likes.user_id
GROUP BY users.id
HAVING Total_likes_by_user = ( SELECT COUNT(*) FROM photos);

/*We also have a problem with celebrities
Find users who have never commented on a photo*/
SELECT username, comment_text
FROM users
LEFT JOIN comments 
ON users.id = comments.user_id
WHERE comments.user_id IS NULL;
		/* OR */
SELECT users.username
FROM users
LEFT JOIN comments ON users.id = comments.user_id
GROUP BY users.id, users.username
HAVING COUNT(comments.user_id) = 0;

/*Mega Challenges
Are we overrun with bots and celebrity accounts?
Find the percentage of our users who have either never commented on a photo or have commented on every photo*/
SELECT 
	ROUND(
    (COUNT(*) / (SELECT COUNT(*) FROM users)) * 100, 2) AS percentage
FROM (
    SELECT u.id FROM users u
    LEFT JOIN comments c ON u.id = c.user_id
    GROUP BY u.id
    HAVING COUNT(c.photo_id) = 0 
        OR 
	COUNT(DISTINCT c.photo_id) = (SELECT COUNT(*) FROM photos)
) AS qualified_users;