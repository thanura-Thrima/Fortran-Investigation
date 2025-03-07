module GEOMETRY
    implicit none
    
    TYPE CIRCLE
        sequence
        real cx
        real cy 
        real radius
    END TYPE CIRCLE
    
    contains

   subroutine CIRCLE_CONSTRUCT(CircleObj,Cx, Cy, Radius) BIND(C, NAME='CIRCLE_CONSTRUCT')
        type(Circle), intent(OUT) :: CircleObj
        real(8), intent(IN)  :: Cx, Cy, Radius
        real(8) PI
        PI = 3.143
        CircleObj%cx = Cx
        CircleObj%cy = Cy
        CircleObj%radius = Radius
        
   end subroutine CIRCLE_CONSTRUCT
   
    subroutine CIRCLE_GET_AREA(CircleObj,Area) BIND(C, NAME='CIRCLE_GET_AREA')
        type(Circle), intent(in) :: CircleObj
        real(8), intent(IN)  :: Area
   
        Area = PI*CircleObj%radius*CircleObj%radius
        
    end subroutine CIRCLE_CONSTRUCT
   
end module GEOMETRY