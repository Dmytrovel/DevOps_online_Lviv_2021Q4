import math

def discr(a,b,c):
 discriminant = b ** 2 - 4 * a * c
 roots(a,b,c,discriminant)
 return discriminant

def roots(a,b,c,discriminant):
 root = math.sqrt(discriminant)
 solv_square(a,b,c,discriminant,root)
 return  a,b,c,discriminant,root
 
def solv_square(a,b,c,discriminant,root):
 x1 = (-b + root) / (2 * a)
 x2 = (-b - root) / (2 * a)
 print ("x1= %.2f" %x1, "x2= %.2f" %x2, "D= %.2f" %discriminant)
 return a,b,c,discriminant,root,x1,x2 

def validate_param():
 while True:
    try:
          a = int(input("a = "))
          b = int(input("b = "))
          c = int(input("c = "))
          break
    except ValueError:
         print("Oops!  That was no valid number.  Try again...")
 discr(a,b,c)

if __name__ == "__main__":
    validate_param()
