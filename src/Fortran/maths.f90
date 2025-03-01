module Math
    implicit none
    contains
    subroutine ADD(a, b, res) BIND(C, NAME='ADD')
        !DEC$ ATTRIBUTES DLLEXPORT :: ADD
        real(8), intent(in) :: a, b
        real(8), intent(out) :: res
        res = a + b
    end subroutine ADD
    
     subroutine SUBSTRACT(a, b, res) BIND(C, NAME='SUBSTRACT')
        !DEC$ ATTRIBUTES DLLEXPORT :: SUBSTRACT
        real(8), intent(in) :: a, b
        real(8), intent(out) :: res
        res = a - b
     end subroutine SUBSTRACT

 end module Math