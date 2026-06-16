import pandas as pd
#load dataset:
df = pd.read_csv("telecom_churn.csv")
print(df.head())
print(df.shape)
print(df.info())

#check missing values:
print(df.isnull().sum())
#check duplicate records:
print(df.duplicated().sum())
#basic statics:
print(df.describe)
#churn distribution-count churned and non churned customers:
print(df['churn'].value_counts())
#calculate churn percentage:
churn_rate =  (df['churn'].mean())*100
print(f"overall churn rate:{churn_rate:.2f}%")


#import visualization library:
import matplotlib.pyplot as plt

# #plot churn distribution:
df['churn'].value_counts().plot(kind='bar')
plt.title("churn distribution") 
plt.xlabel("churn")
plt.ylabel("no. of customers")
plt.show() 


print(df['churn'].dtype)
#correlation analysis:
Corr = df.corr(numeric_only = True)
print(Corr['churn'].sort_values(ascending = False))

#create heatmap:
import seaborn as sns
import matplotlib.pyplot as plt

plt.figure(figsize=(12,8))
sns.heatmap(df.corr(numeric_only=True) , annot=True)
plt.title("correlation heatmap")
plt.show()

#customer service calls vs churn:
sns.boxplot(x = "churn", y = "customer_service_calls",data=df)
plt.title("Customer service calls vs churn")
plt.show()

#total day minutes vs churn:
sns.boxplot(x = "churn", y = "total_day_minutes",data=df)
plt.title("Total day minutes vs churn")
plt.show()