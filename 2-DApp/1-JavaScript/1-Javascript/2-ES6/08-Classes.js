/*
///////////////////////////////////////////////////////
//  Classes in ES6
///////////////////////////////////////////////////////

In this lesson we'll explain 
how to create a class 
that can be used to create multiple objects of the same structure.

A class uses the keyword class 
and contains a constructor method for initializing.


For example:



        class Rectangle {
            constructor(height, width) {
                this.height = height;
                this.width = width;
            }
        }

    

A declared class can then be used to 
create multiple objects using the keyword new.

For example:



        class Rectangle {
            constructor(height, width) {
                this.height = height;
                this.width = width;
            }
        }

        const square = new Rectangle(5, 5);
        const poster = new Rectangle(2, 3); 

        console.log(square.height);



Class Declarations are not hoisted 
while Function Declarations are. 
If you try to access your class before declaring it, 
ReferenceError will be returned.

    
You can also define a class with a class expression, 
where the class can be named or unnamed.

A named class looks like:


        var Square = class Rectangle {
            constructor(height, width) {
                this.height = height;
                this.width = width;
            }
        };


In the unnamed class expression, 
a variable is simply assigned the class definition:


        var Square = class {
            constructor(height, width) {
                this.height = height;
                this.width = width;
            }
        };
    


The constructor is a special method 
which is used for creating and initializing an object created with a class.

There can be only one constructor in each class.


    ---------------------------
    Class Methods in ES6
    ---------------------------
    ES6 introduced a shorthand 
    that does not require the keyword function 
    for a function assigned to a method's name. 
    
    One type of class method is the prototype method, 
    which is available to objects of the class.

    For Example:
    


        class Rectangle {

            constructor(height, width) {
                this.height = height;
                this.width = width;
            }
            
            get area() {
                return this.calcArea();
            }

            calcArea() {
                return this.height * this.width;
            }
        }

        const square = new Rectangle(5, 5);
        console.log(square.area); // 25

        // In the code above, area is a getter, calcArea is a method.



    Another type of method is the "static method"
    which cannot be called through a class instance. 
    Static methods are often used to create utility functions for an application.

    For Example:



        class Point {

            constructor(x, y) {
                this.x = x;
                this.y = y;
            }

            static distance(a, b) {
                const dx = a.x - b.x;
                const dy = a.y - b.y;

                return Math.hypot(dx, dy);
            }
        }

        const p1 = new Point(7, 2);
        const p2 = new Point(3, 8);

        console.log(Point.distance(p1, p2));    // 7.211102550927979



    As you can see, 
    the static distance method is called directly using the class name, 
    without an object.



        function main() {
            var exam1 = parseInt(readLine(), 10);
            var exam2 = parseInt(readLine(), 10);
            var exam3 = parseInt(readLine(), 10);
            console.log(Exams.average(exam1,exam2,exam3));
        }

        class Exams{
            static average(e1, e2, e3) {
                return Math.round((e1 + e2 + e3)/3);
            }
        }


    

    
------------------------------------------
                Examples
------------------------------------------

    class Add {
        constructor(...words) {
            this.words = words;
        }
        print() {
            var msg='$';
            for (var word of this.words) {
                msg += word +'$';
            }
            console.log(msg);
        }
    }

    var x = new Add("hehe", "hoho", "haha", "hihi", "huhu");
    var y = new Add("this", "is", "awesome");
    var z = new Add("lorem", "ipsum", "dolor", "sit", "amet", "consectetur", "adipiscing", "elit");

    x.print();
    y.print();
    z.print();


    Output:

        $hehe$hoho$haha$hihi$huhu$
        $this$is$awesome$
        $lorem$ipsum$dolor$sit$amet$consectetur$adipiscing$elit$

*/