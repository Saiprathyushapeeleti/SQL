CREATE TABLE Student (
   id        int            
  ,[name]    varchar(50) 
  ,class    varchar(10) 
  ,mark        int        
  ,grade    varchar(3)    
);
 
INSERT INTO Student (id, [name], class, mark, grade) VALUES
(1, 'John Deo', 'Four', 75, 'A'),
(2, 'Max Ruin', 'Three', 85, 'B'),
(3, 'Arnold', 'Three', 55, 'C'),
(4, 'Krish Star', 'Four', 60, 'A'),
(5, 'John Mike', 'Four', 60, 'C'),
(6, 'Alex John', 'Four', 55, 'A'),
(7, 'My John Rob', 'Five', 78, 'C'),
(8, 'Asruid', 'Five', 85, 'A'),
(9, 'Tes Qry', 'Six', 78, 'B'),
(10, 'Big John', 'Four', 55, 'B'),
(11, 'Ronald', 'Six', 89, 'B'),
(12, 'Recky', 'Six', 94, 'C'),
(13, 'Kty', 'Seven', 88, 'C'),
(14, 'Bigy', 'Seven', 88, 'A'),
(15, 'Tade Row', 'Four', 88, 'B'),
(16, 'Gimmy', 'Four', 88, 'A'),
(17, 'Tumyu', 'Six', 54, 'B'),
(18, 'Honny', 'Five', 75, 'C'),
(19, 'Tinny', 'Nine', 18, 'B'),
(20, 'Jackly', 'Nine', 65, 'A'),
(21, 'Babby John', 'Four', 69, 'B'),
(22, 'Reggid', 'Seven', 55, 'C'),
(23, 'Herod', 'Eight', 79, 'B'),
(24, 'Tiddy Now', 'Seven', 78, 'B'),
(25, 'Giff Tow', 'Seven', 88, 'C'),
(26, 'Crelea', 'Seven', 79, 'B'),
(27, 'Big Nose', 'Three', 81, 'A'),
(28, 'Rojj Base', 'Seven', 86, 'A'),
(29, 'Tess Played', 'Seven', 55, 'B'),
(30, 'Reppy Red', 'Six', 79, 'B'),
(31, 'Marry Toeey', 'Four', 88, 'B'),
(32, 'Binn Rott', 'Seven', 90, 'A'),
(33, 'Kenn Rein', 'Six', 96, 'A'),
(34, 'Gain Toe', 'Seven', 69, 'B'),
(35, 'Rows Noump', 'Six', NULL, 'A');
select * from student 
where(grade = 'A' and class = 6) or (grade = 'B' and mark between 60 and 80) or (grade = 'c' and mark < 60);

/*Class Six with Grade A 
        or Class Three with Grade C
*/
select * from student 
where(class ='six' and grade = 'A') or (class ='Three' and grade = 'c');

update student set grade = 
case 
when mark >=80 then 'A'
when mark >=60 and mark <80 then 'B'
when mark <60 then 'C'
else null
end


update student set grade = 'C' where mark <80

update student set mark = null where class='four' --9

update student set  mark = 30 where grade = 'C' and class = 'four'; --3+4+2--9

update student set  mark = 
case
when mark is null and grade = 'C' then   30
when mark is null and grade = 'B' then   60
when mark is null and grade = 'A' then   80
end
where class = 'four'
;

select * from student where class = 'four'

delete student where name like 'R%';

select * from student where name like '%x%'

select min(mark) as min_marks,max(mark) as max_marks,grade from student 
group by grade;

select min(mark) as min_marks,max(mark) as max_marks,avg(mark),class from student 
group by class;

select sum(mark) as total,count(id)as count,class from student
group by class;

select grade,class,sum(mark) from student
group by grade,class
having sum(mark)>100;

select top 1 * from student order by mark desc


with m_m as(
select distinct class,max(mark)as max_mark from student group by class

select s.id,s.name,s.class,s.mark,s.grade from student S
inner join m_m
on s.mark = m_m.max_mark
order by s.mark;



