import Init.System.IO

inductive Expr : Type
| add : Expr → Expr → Expr
| mul : Expr → Expr → Expr
| lit : Nat → Expr
deriving Repr

/- Exercise 1: Expr syntax and semantics -/

/- Exercise 1a: write an evaluation function. it should pass the following tests -/
def Expr.eval : Expr → Nat := sorry

def e1 : Expr := .add (.lit 1) (.lit 2)
def e2 : Expr := .add (.mul (.lit 3) (.lit 4)) (.lit 2)

#eval e1.eval = 3
#eval e2.eval = 14

/- Exercise 1b: write an OfNat instance for Expr. the following expressions should then type check: -/
instance : OfNat Expr n := sorry

#eval (3 : Expr)
#eval (.add 1 2 : Expr)
#eval (.mul 100 2 : Expr)

/- Exercise 1c: write Add/Mul instances for Expr -/

instance : Add Expr := sorry
instance : Mul Expr := sorry

#eval (3 * 4 : Expr)
#eval (3 * 4 : Expr).eval = 12


/- Exercise 2: a compiler for Expr
  end result: a file containing x86 or RISC-V assembly that can be assembled and runs to evaluate the given expr
  constraints:
    - don't just precompute the value at compile time :)
    - don't go straight to the string; first design an IR for assembly code.
        write a function of type Expr → IR and then another of type IR → String.

  bonus: add more fun to the Expr type, like `let` expressions or `if .. then .. else`. extend Expr.eval and Expr.compile
-/

open IO.FS (writeFile)
def Expr.compile : Expr → FilePath → IO Unit := sorry

/- Exercise 3: joins via polynomial multiplication

  1 Design a representation `Poly` for the set of polynomials over variables $x_ij$ modulo the equations:
    - x_ij * x_ij = x_ij
    - x_ij * y_ik = 0, if j ≠ k
    You should assume the set of variables is possibly infinite;
    you can assume `i, j, k ∈ String` (or Nat, or an abstract variable).
    At this step, your representation doesn't necessarily need to care about the equations.

  2 Write a function that multiplies them (now the equations are important).
    Also a write a function `canonical : Poly → Poly` that puts a polynomial into a canonical form, that is:
      - Suppose `[r] = p` means "`(r : Poly)` represents the polynomial `p`".
        Then we want  `∀ (f, g : Poly), [f] = [g] → f.canonical = g.canonical`
-/

def main : IO Unit := IO.println s!"hello!"


/- Exercise 2 part 2: (harder) Design a formal semantics for your assembly IR and prove that your compiled code computes the same result as Expr
    for semantics ideas, see:
      - https://raw.githubusercontent.com/blanchette/logical_verification_2022/master/hitchhikers_guide.pdf,
      - http://adam.chlipala.net/frap/frap_book.pdf,
      - (more advanced) https://hal.science/hal-03255472v3

-/
