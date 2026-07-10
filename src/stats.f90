subroutine average(values, n, result)

    implicit none

    integer :: n
    real*8 :: values(n)
    real*8 :: result
    integer :: i

    result = 0.0

    do i = 1, n
        result = result + values(i)
    end do 

    result = result / n
end
