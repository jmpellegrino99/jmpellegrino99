import numpy as np
import matplotlib.pyplot as plt
import pandas as pd
import sqlite3
from scipy.stats import rankdata

num_rows = 100623

# Generate checking account numbers
checking_acct_no_int = [
    str(int(item))
    for item in np.random.uniform(low=100000000000, high=999999999999, size=num_rows)
]
checking_acct_no = [
    "0000" + item
    for item in checking_acct_no_int
]

# Checking balances
checking = np.random.exponential(scale=2500, size=num_rows)

# Checking ranks
checking_ranks = rankdata(checking, method='average')

# State assignment
states = ['OH', 'NY', 'PA', 'WA', 'CO', 'Other']
state = []
for rank in checking_ranks:
    state_probabilities = [0.3, 0.35, 0.1 - (rank / num_rows) / 25, 0.07 + (rank / num_rows) / 50,
                           0.05 + (rank / num_rows) / 50, 0.13]
    state.append(np.random.choice(states, p=state_probabilities))

# Primacy assignment
primacy = [
    np.random.rand() < rank / num_rows for rank in checking_ranks
]

# Savings balances, correlated with checking balance
savings = []
for checking_bal in checking:
    classifier = np.random.rand()
    if classifier < 0.3:
        savings.append(None)
    else:
        savings.append(max(
            np.random.normal(loc=0.5 * checking_bal, scale=0.05 * checking_bal) + 10000*(np.random.rand() - 0.5)
            , 10)
        )

# Print summary statistics
print("min acct no: ", np.min([int(item) for item in checking_acct_no]))
print("max acct no: ", np.max([int(item) for item in checking_acct_no]))
print("max checking: ", round(np.max(checking),2))
print("min checking: ", round(np.min(checking),2))

# Handle None values in savings before calculating max/min
savings_cleaned = [s for s in savings if s is not None]
if savings_cleaned:
    print("max savings: ", round(np.max(savings_cleaned),2))
    print("min savings: ", round(np.min(savings_cleaned),2))
else:
    print("No valid savings data")

print("min checking rank: ", np.min(checking_ranks))
print("max checking rank: ", np.max(checking_ranks))
print("sum of primacy: ", sum(primacy))
print("unique # of acct nos: ", len(set(checking_acct_no_int)))
print("sum of checking bals: ", round(np.sum(checking),0))
if savings_cleaned:
    print("sum of savings bals: ", round(np.sum(savings_cleaned),2))
else:
    print("No valid savings data")

if len(set(checking_acct_no_int)) == num_rows:
    print("All account numbers are unique.")
else:
    print("There is at least one account number duplicate.")

# Create DataFrame
df = pd.DataFrame(data={
    "account_no": checking_acct_no,
    "state": state,
    "checking": checking,
    "savings": savings,
    "primacy": primacy
})

# Print state value counts and unique states
print(df["state"].value_counts())
print("unique list of states: ", list(set(str(st) for st in state)))
print("\n")
print("checking/savings corr: ", round(df['checking'].corr(df['savings']),2))
print("\nchecking/primacy corr: ", round(df['checking'].corr(df['primacy']),2))
print("\nsavings/primacy corr: ", round(df['savings'].corr(df['primacy']),2))
print("\n")

# Save DataFrame to CSV
df.to_csv('checking.csv', index=False)

# Set up a SQL connection
conn = sqlite3.connect('sql_training_data.db')

df.to_sql('training', conn, if_exists='replace', index=False)

query = """
select
count(*)
from training
where savings = 10
"""

df_from_db = pd.read_sql_query(query,conn)

conn.close()

print("Output from SQL query:")
print(df_from_db)


