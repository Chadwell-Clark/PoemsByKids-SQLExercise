--Chad[well] Clark
--SQL Poems by Kids Dataset Exercise

--What grades are stored in the database? 1st through 5th
--SELECT * From Grade

--What emotions may be associated with a poem?*/ Anger,Fear, Sadness,Joy
--SELECT Name FROM Emotion

--How many poems are in the database? 32842
--SELECT Count(id) Number_of_Poems FROM Poem

--Sort authors alphabetically by name. What are the names of the top 76 authors?
--SELECT Top 76 a.Name Author From Author a ORDER BY a.Name ASC

--Starting with the above query, add the grade of each of the authors.
--SELECT Top 76 a.Name PoemAuthor, g.name Grade From Author a Join Grade g on a.GradeId = g.id ORDER BY a.Name ASC

--Starting with the above query, add the recorded gender of each of the authors.
--SELECT Top 76 a.Name PoemAuthor, g.name Grade, ge.Name From Author a  Join Grade g on a.GradeId = g.id  Join Gender ge on ge.Id = a.GenderId  ORDER BY a.Name ASC 

--What is the total number of words in all poems in the database?
/*SELECT 
sum(datalength(p.Text) - datalength(REPLACE(cast (p.text as nvarchar(max)), ' ', '')) + 1) as wordcount
FROM Poem p;*/
--Select top 5 * From Poem
--SELECT Sum(p.wordcount) Total_Words from Poem p;

--Which poem has the fewest characters?
--SELECT Top 1 * FROM Poem p Order by p.charcount asc ;

--How many authors are in the third grade?
--Select * from grade
--SELECT Count(a.id) '3rd_grade_authors' From author a Join Grade g on a.GradeId = g.Id where g.name = '3rd Grade';


--How many total authors are in the first through third grades?
--SELECT Count(a.id) '1st through 3rd grade authors' From author a Join Grade g on a.GradeId = g.Id where g.name = '3rd Grade' or g.name = '1st Grade' or g.name = '2nd Grade';


--What is the total number of poems written by fourth graders?
--SELECT Count(p.id) 'Poems by Fourth Graders' FROM Poem p Join Author a  on p.authorid = a.Id join grade g on g.id = a.GradeId Where g.name = '4th Grade';


--How many poems are there per grade?
/*SELECT 
Count(p.id) 'Poems Total',
g.Name Grades
FROM Poem p 
Join Author a 
on p.AuthorId = a.Id 
Join Grade g 
on a.GradeId = g.id  
Group By g.name*/


--How many authors are in each grade? (Order your results by grade starting with 1st Grade)
/*SELECT 
Count(a.id) 'Authors',
g.Name Grades
FROM Author a 
Join Grade g 
on a.GradeId = g.id  
Group By g.name 
Order By g.Name Asc*/


--What is the title of the poem that has the most words?
--SELECT Top 1 p.title 'Poem with the Most Words' FROM Poem p Group by p.title Order By Max(p.WordCount) Desc;


--Which author(s) have the most poems? (Remember authors can have the same name.) 
/*SELECT 
a.Name 'Author(s) with most Poems', Count(p.id) 'Number of Poems' 
FROM Author a 
JOIN Poem p 
ON a.Id = p.AuthorId 
Group BY A.name, a.id 
Order BY Count(p.id) DEsc*/



--How many poems have an emotion of sadness?
--SELECT Count(p.id) 'Number of poems whose emotion is sadness' FROM POEM p  JOIN PoemEmotion pe on p.id = pe.PoemId JOIN Emotion e ON pe.EmotionId = e.Id Where e.name = 'sadness'


--How many poems are not associated with any emotion? 64030
/*SELECT Count(p.id) 'Number of poems that are not associated with an emotion' 
FROM POEM p  
Left JOIN PoemEmotion pe on p.id = pe.PoemId  
Where pe.id is null*/


--Which emotion is associated with the least number of poems?
--SELECT Top 1 e.Name Emotion, Count(pe.EmotionId) Nmber FROM Emotion e Join PoemEmotion pe on e.Id = pe.EmotionId JOIN poem p on pe.PoemId = p.Id Group By e.name Order by Count(pe.EmotionId) asc



--Which grade has the largest number of poems with an emotion of joy? 1st grade
/*SELECT 
g.name 'Grade with # of poems with largest emotion of Joy' ,
Count(p.id) Grade
From Poem p
Join PoemEmotion pe 
ON p.id = pe.PoemId
Join Emotion e
ON pe.EmotionId = e.id
Join author a on p.AuthorId = a.id
join grade g on a.GradeId = g.id
Where e.name = 'joy'
Group By g.name 
Order BY Count(p.id) desc; */

--Which gender has the least number of poems with an emotion of fear? Female
/*Select
Top 1
g.Name 'Gender fear level',
Count(p.id) Number
From Gender g
Join Author a
ON g.id = a.GenderId
Join Poem p
On a.id = p.AuthorId
Join PoemEmotion pe
On p.id = pe.PoemId
Join emotion e
ON pe.EmotionId = e.Id
Where e.name = 'fear'
Group By g.name
Order BY Count(p.id) asc*/