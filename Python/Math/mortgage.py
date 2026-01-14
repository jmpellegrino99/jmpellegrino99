#!/usr/bin/python3

def mortgage_calculator(amount_mortgaged, term_years, rate_percentage):
    # Convert annual rate percentage to decimal and monthly rate
    rate_decimal = rate_percentage / 100
    monthly_rate = rate_decimal / 12

    # Convert term in years to total number of payments (months)
    total_payments = term_years * 12

    # Calculate monthly mortgage payment using the formula for fixed-rate mortgage
    # P = L[c(1 + c)^n] / [(1 + c)^n - 1]
    # Where P is the monthly payment, L is the loan amount, c is the monthly interest rate, and n is the number of payments
    monthly_payment = amount_mortgaged * (monthly_rate * (1 + monthly_rate) ** total_payments) / \
                      ((1 + monthly_rate) ** total_payments - 1)

    return monthly_payment

# Example usage
amount = float(input("Enter the amount mortgaged: "))
term = int(input("Enter the term in years: "))
rate = float(input("Enter the rate expressed as a percentage: "))

monthly_payment = mortgage_calculator(amount, term, rate)
print("Monthly mortgage payment: ${:.2f}".format(monthly_payment))
