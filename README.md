# 💳 Credit Card Approval Prediction & Data Analysis

An end-to-end machine learning project that analyses client data and predicts credit card application outcomes. It covers data cleaning, feature engineering, EDA, class-imbalance handling with **SMOTE**, and comparison of **Logistic Regression, Decision Tree, KNN, Random Forest and XGBoost**.

![Python](https://img.shields.io/badge/Python-3.x-blue?logo=python&logoColor=white)
![Pandas](https://img.shields.io/badge/pandas-data%20analysis-150458?logo=pandas)
![scikit-learn](https://img.shields.io/badge/scikit--learn-ML-orange?logo=scikit-learn&logoColor=white)
![XGBoost](https://img.shields.io/badge/XGBoost-boosting-green)
![imbalanced-learn](https://img.shields.io/badge/imbalanced--learn-SMOTE-lightgrey)

---

## 📖 Introduction

A credit card lets you borrow money from a bank up to a set limit, which you repay later with interest and fees. Analysing client data helps banks:

- Make more **accurate, informed lending decisions**
- **Reduce risk** from defaults and fraud
- Improve customer experience and operational efficiency
- Go beyond a single score (e.g. CIBIL) when deciding credit limits and approvals

---

## 📂 Dataset

The project uses two files, merged on the client ID (`ind_id`):

| File | Description |
|---|---|
| `Credit_card.csv` | Client features (1,548 rows × 18 columns) |
| `Credit_card_label.csv` | Target label per client (1,548 rows × 2 columns) |

| Feature | Description |
|---|---|
| `ind_id` | Client ID |
| `gender` | Gender of the client |
| `car_owner` / `property_owner` | Owns a car / property |
| `children` | Number of children |
| `annual_income` | Annual income |
| `type_income` | Income type (Working, Pensioner, Commercial associate, State servant) |
| `education` | Education level |
| `marital_status` | Marital status |
| `housing_type` | Housing type |
| `birthday_count` | Age in days (converted to `age`) |
| `employed_days` | Employment duration in days (converted to `experience`) |
| `type_occupation` | Occupation type |
| `family_members` | Family size |
| `label` | **Target** (0 = approved, 1 = rejected, as defined in the notebook) |

---

## 🔄 Project Workflow

1. **Data collection and integration:** loaded both CSVs and merged them with an inner join.
2. **Data exploration:** shape, data types, duplicates and null analysis.
3. **Data cleaning**
   - Dropped uninformative columns: `mobile_phone`, `work_phone`, `phone`, `email_id`
   - Fixed the column name `propert_owner` → `property_owner`
4. **Feature engineering**
   - `birthday_count` → `age` (days → years)
   - `employed_days` → `experience` (days → years)
   - **Square-root transform** on `experience` (skewness 1.73 → 0.26), then IQR outlier capping and median imputation
   - **Log transform** on `annual_income` (skewness 3.92 → 0.20)
5. **Missing values**
   - `gender`: mode imputation
   - `age`: KNN imputation
   - `annual_income`: rows with nulls dropped (23)
   - `type_occupation`: dropped (~31.5% missing)
6. **Outlier treatment:** removed 18 `children` outliers using the IQR method.
7. **Exploratory data analysis:** bivariate and multivariate analysis.
8. **Feature selection:** feature importance with `ExtraTreesRegressor`.
9. **Preprocessing:** 75/25 train-test split, One-Hot and Ordinal encoding with `ColumnTransformer`, **SMOTE** oversampling, and `StandardScaler`.
10. **Modeling:** each algorithm was built as a baseline, with SMOTE, and with hyperparameter tuning (`GridSearchCV`, 10-fold CV).

---

## 🔍 Key EDA Findings

- The **"Working"** income group makes up the largest share of applicants.
- The **House / Apartment** housing type dominates the dataset.
- **Commercial associates** have the highest average annual income, and **pensioners** the lowest.
- Average income is highest in the **25–35** age group and lowest for **60+**.
- The class distribution is **imbalanced** (about 89% vs 11%), which is why SMOTE was used.
- The top features by importance were **Age, Annual Income, Experience, Family Members and Children**.

---

## 🤖 Models and Results

Test set accuracy (377 samples):

| Model | Baseline | With SMOTE | Hyperparameter Tuned |
|---|---|---|---|
| Logistic Regression | 88% | 59% | 88% |
| Decision Tree | 85.1% | 87% | 88.1% |
| KNN | 85.7% | 78% | 88.1% |
| **Random Forest** | 90.2% | **93.1%** | 89.1% |
| XGBoost | 86.7% | 91% | – |

### Observations
- **SMOTE** improved Decision Tree, Random Forest and XGBoost, but hurt Logistic Regression and KNN.
- The Logistic Regression baseline predicted only the majority class, so its 88% accuracy mostly reflects the class imbalance.
- **Hyperparameter tuning** did not improve Random Forest over the SMOTE model.
- **Random Forest + SMOTE** gave the best overall results.

### Best Model: Random Forest + SMOTE

| Metric | Value |
|---|---|
| Accuracy | **93.1%** |
| Precision (approved class) | ~94% |
| Recall (approved class) | ~98% |
| F1-score (approved class) | ~96% |

---

## ✅ Conclusion

The **Random Forest model trained on SMOTE-balanced data** gave the best predictions and the fewest errors. It can help a bank make faster, more consistent credit card decisions and reduce the risk of approving unqualified applicants.

---

## 🛠 Tech Stack

- **Language:** Python
- **Data handling:** `pandas`, `numpy`
- **Visualization:** `matplotlib`, `seaborn`
- **Machine learning:** `scikit-learn`, `xgboost`
- **Imbalanced data:** `imbalanced-learn` (SMOTE)

---

## 📁 Repository Structure

```
├── Credit_Card_Data_Analysis.ipynb   # Main analysis and modeling notebook
├── Credit_card.csv                   # Client features
├── Credit_card_label.csv             # Target labels
└── README.md                         # Project documentation
```

---

## 👤 Author

**Karan**
[LinkedIn](https://www.linkedin.com/in/karanmeher/) · [GitHub](https://github.com/karan-meher)
