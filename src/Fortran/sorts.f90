module SORT
    implicit none
    contains
    subroutine BUBBLE_SORT(Array, Count) BIND(C, NAME='BUBBLE_SORT')
        !DEC$ ATTRIBUTES DLLEXPORT :: BUBBLE_SORT
        use iso_c_binding, only: c_int, c_double
        integer, intent(IN) :: Count
        real(8), intent(INOUT)  :: Array(Count)
        real(8) Temp

        integer I, J
        logical Sorted
        Sorted = .FALSE.
        I = 0
        do while (.NOT. Sorted)
            Sorted = .TRUE.
            I= I+1
            do J=1, count-I
                if ( Array(J)>Array(J+1)) then
                    Temp = Array(J+1)
                    Array(J+1) = Array(J)
                    Array(J) = Temp
                    Sorted = .FALSE.
                end if
            end do
        end do
    end subroutine BUBBLE_SORT
    
    subroutine QUICK_SORT(Array, Count) BIND(C, NAME='QUICK_SORT')
        !DEC$ ATTRIBUTES DLLEXPORT :: QUICK_SORT
        use iso_c_binding, only: c_int, c_double
        integer, intent(IN) :: Count
        real(8), intent(INOUT)  :: Array(Count)
        
        call RECURSIVE_QUICK_SORT(Array,Count,1,Count)
    end subroutine QUICK_SORT
    
    recursive subroutine RECURSIVE_QUICK_SORT(Array,Count,L,R)
        integer, intent(IN) :: Count, L, R
        real(8), intent(INOUT)  :: Array(Count)
        real(8) SwapTMP
        integer TMPL,TMPR
        if( L < R ) then
            TMPL = L
            TMPR = R
            do
                do while ( TMPL<R .AND. Array(TMPL) <= Array(L) )
                    TMPL = TMPL + 1 
                end do
                do while ( L<TMPR .AND. Array(TMPR) >= Array(L) )
                    TMPR = TMPR - 1 
                end do
                if (TMPL <TMPR) then
                    SwapTMP = Array(TMPL)
                    Array(TMPL) = Array(TMPR)
                    Array(TMPR) = SwapTMP 
                end if
                if (TMPL >=TMPR) EXIT
            end do
            SwapTMP = Array(L)
            Array(L) = Array(TMPR)
            Array(TMPR) = SwapTMP
            
            call RECURSIVE_QUICK_SORT(Array,Count,L,TMPR-1)
            call RECURSIVE_QUICK_SORT(Array,Count,TMPR+1,R)
        end if
    end subroutine RECURSIVE_QUICK_SORT
end module SORT