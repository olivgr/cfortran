subroutine average(values, n, result)
    implicit none
    integer :: n
    real*8 :: values(n)
    real*8 :: result
    integer :: i

    ! Initialize the sum of elements to zero
    result = 0.0

    ! Calculate the sum of all elements in the array
    do i = 1, n
        result = result + values(i)
    end do 

    ! Calculate the arithmetic mean by dividing the sum by the number of elements
    if (n /= 0) then
        result = result / n
    else
        ! Handle the case where n is zero to avoid division by zero
        result = 0.0
    end if
end subroutine average

subroutine harmonic_mean(values, n, result)
    implicit none
    integer :: n
    real*8 :: values(n)
    real*8 :: result
    integer :: i
    real*8 :: sum

    ! Initialize the sum of reciprocals to zero
    sum = 0.0

    ! Calculate the sum of reciprocals.
    do i = 1, n
        if (values(i) /= 0) then
            sum = sum + 1.0 / values(i)
        else
            result = 0.0  ! If any element is zero, the harmonic mean is undefined and set to zero
            return
        end if
    end do

    ! Calculate the harmonic mean
    if (sum /= 0) then
        result = n / sum
    else
        result = 0.0  ! In case of division by zero due to all zeros in values, set the result to zero
    end if
end subroutine harmonic_mean

subroutine median(values, n, result)
    implicit none
    integer :: n
    real*8 :: values(n)
    real*8 :: result
    integer :: i, j
    real*8 :: temp

    ! Copy the array to avoid modifying the original data
    real*8 :: sorted_values(n)
    do i = 1, n
        sorted_values(i) = values(i)
    end do

    ! Sort the copied array in ascending order using bubble sort
    do i = 1, n-1
        do j = 1, n-i
            if (sorted_values(j) > sorted_values(j+1)) then
                temp = sorted_values(j)
                sorted_values(j) = sorted_values(j+1)
                sorted_values(j+1) = temp
            end if
        end do
    end do

    ! Calculate the median
    if (mod(n, 2) == 0) then
        ! If even number of elements, take average of two middle elements
        result = (sorted_values(n/2) + sorted_values(n/2 + 1)) / 2.0
    else
        ! If odd number of elements, the middle element is the median
        result = sorted_values((n+1)/2)
    end if
end subroutine median
