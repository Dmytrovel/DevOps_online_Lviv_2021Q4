import unittest
import solv_square_equation
from solv_square_equation import discr,roots

class MyTestCase(unittest.TestCase):
    # If quadratic equation has ONE roots
    def test_discr(self):
        self.assertEqual(solv_square_equation.discr(2, 8, 6), 16)

    def test_roots(self):
        self.assertEqual(solv_square_equation.roots(2, 8, 6, 16), 4)

    def test_solv_square(self):
        self.assertEqual(solv_square_equation.solv_square(2, 8, 0, 4, 0), (-1.0, -3.0))

if __name__ == '__main__':
    unittest.main()
