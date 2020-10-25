#!/usr/bin/python3

print("This game will tell your star sign if you enter your birthdate :)")
month_days = [31, 29, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
sign_days =  [22, 20, 19, 21, 20, 21, 21, 21, 21, 21, 21, 21]
astro_signs = [ "Sagittarius", "Capricorn","Aquarius","Pisces","Aries","Taurus","Gemini","Cancer","Leo","Virgo","Libra","Scorpio"]
month   = int(input("When is your birth month (1-12): "))
day     = int(input("Enter birth date: (1-31) "))

for month_idx in range(1, 13):
    if month_idx == month:
        if day > 0 and day < month_days[month_idx]:
            if day < sign_days[month_idx]:
                print("You were born on", day, "And your Zodiac sign is", astro_signs[month_idx])
            else:
                if month_idx == 12:
                    print("You were born on", day, "And your Zodiac sign is", astro_signs[0])
                else:
                    print("You were born on", day, "And your Zodiac sign is", astro_signs[month_idx+1])






# birthday = month, day
# birthday = list(birthday)

# if birthday[0] == "December" and birthday[1] < 22:
#     astro_sign = 'Sagittarius' 
# else: astro_sign = 'Capricorn'

# if birthday[0] == "January" and birthday[1] < 20:
#     astro_sign = 'Capricorn' 
# else: astro_sign = 'Aquarius'

# if birthday[0] == "February" and birthday[1] < 19:
#     astro_sign = 'Aquarius' 
# else: astro_sign = 'Pisces'

# if birthday[0] == "March" and birthday[1] < 21:
#     astro_sign = 'Pisces' 
# else: astro_sign = 'Aries'

# if birthday[0] == "April" and birthday[1] < 20:
#     astro_sign = 'Aries'
# else: astro_sign ='Taurus'

# if birthday[0] == "May" and birthday[1] < 21:
#     astro_sign = 'Taurus'
# else: astro_sign = 'Gemini'

# if birthday[0] == "June" and birthday[1] < 21:
#     astro_sign = 'Gemini'
# else: astro_sign = 'Cancer'

# if birthday[0] == "July" and birthday[1] < 21:
#     astro_sign = 'Cancer'
# else: astro_sign = 'Leo'

# if birthday[0] == "August" and birthday[1] < 21:
#     astro_sign = 'Leo' 
# else: astro_sign = 'Virgo'

# if birthday[0] == "September" and birthday[1] < 21:
#     astro_sign = 'Virgo'
# else: astro_sign = 'Libra'

# if birthday[0] == "October" and birthday[1] < 21:
#     astro_sign = 'Libra'
# else: astro_sign = 'Scorpio'

# if birthday[0] == "November" and birthday[1] < 21:
#     astro_sign == 'Scorpio'
# else: 'Sagittarius'

# print("You were born on", birthday, "And your Zodiac sign is", astro_sign)
