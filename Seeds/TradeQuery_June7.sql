SELECT t.Id, t.[Status], t.BookOneId, t.BookTwoId
FROM [User] as u
INNER JOIN [Collection] as c
ON u.Id = c.UserId
INNER JOIN Book as b
ON c.Id = b.CollectionId
INNER JOIN Trade as t
ON b.Id = t.BookOneId 
UNION
SELECT t.Id, t.[Status], t.BookOneId, t.BookTwoId
FROM [User] as u
INNER JOIN [Collection] as c
ON u.Id = c.UserId
INNER JOIN Book as b
ON c.Id = b.CollectionId
INNER JOIN Trade as t
ON b.Id = t.BookTwoId 
