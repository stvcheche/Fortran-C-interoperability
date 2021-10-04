!     
! File:   fortranresource.F90
! Author: Steve
!
! Created on October 4, 2021, 7:49 PM
!

!Format integer
function fortformatint(inputnum) bind(c, name = 'fortformatint')
    use, intrinsic :: iso_c_binding
    implicit none

    type(c_ptr) :: fortformatint

    !Declarations
    integer :: inputnum
    integer :: intlen, strlen, inputdivs, inputmods, incrfro, incrto, substrfro, substrto, moddivs, i
    character(len = 50) :: converted
    character(len = 50) :: convertedmod
    character(len = 50), target, save :: output

    intlen = popcnt(inputnum)

    !Convert integer to string
    write(converted, "(I0)") inputnum
    convertedmod = trim(converted)
    strlen = len(trim(convertedmod))

    !Get modulus and division by the partition lengths
    inputmods = mod(strlen, 3)


    if (inputmods > 0) then
	moddivs = 1
    else
	moddivs = 0
    end if

    inputdivs = (strlen/3) + moddivs

    !Get initial sub string and increamental values
    if (inputdivs > 0 .and. inputmods > 0 .or.inputdivs > 1 .and. inputmods == 0) then
	if (inputmods == 0)then
	    substrfro = 1
	    substrto = 3
	    incrfro = 3

	else if (inputmods == 1)then
	    substrfro = 1
	    substrto = 1
	    incrfro = 1

	else if (inputmods == 2)then
	    substrfro = 1
	    substrto = 2
	    incrfro = 2

	end if

	incrto = 3
    end if

    !Format string
    output = ""

    if (inputdivs == 1)then
	output = trim(convertedmod)

    else
	do i = 1, inputdivs

	    if (i .ne. inputdivs .and. inputmods .ne. 0) then
		output = trim(output) // convertedmod(substrfro:substrto) // ","

	    else if (i .ne. inputdivs .and. inputmods == 0) then
		output = trim(output) // convertedmod(substrfro:substrto) // ","

	    else
		output = trim(output) // convertedmod(substrfro:substrto) // C_NULL_CHAR

	    end if

	    if (i == 1) then
		substrfro = substrfro + incrfro
		substrto = substrto + incrto

	    else
		substrfro = substrfro + incrto
		substrto = substrto + incrto

	    end if
	end do
    end if

    fortformatint = c_loc(output)
end function fortformatint

