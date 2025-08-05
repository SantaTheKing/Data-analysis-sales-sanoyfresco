# Data Analysis - Sales Sano y Fresco

## Project Overview

This project performs comprehensive sales data analysis for "Sano y Fresco", focusing on **Market Basket Analysis** to identify product associations and purchasing patterns. The analysis helps understand customer behavior, product relationships, and provides insights for business optimization strategies.

### Key Features
- **Market Basket Analysis**: Identifies which products are frequently bought together
- **Association Rules Mining**: Calculates support, confidence, and lift metrics
- **Sales Performance Analysis**: Analyzes revenue by departments, sections, and products
- **Customer Behavior Insights**: Examines purchasing patterns and trends
- **Data Visualization**: Provides clear insights through data transformations

## Project Structure

```
Data-analysis-sales-sanoyfresco/
├── README.md                                    # This file
├── TPE_MarketBasketAnalysis_colab.ipynb        # Main analysis notebook
├── Documento de Requerimientos Funcionales de Negocio.docx  # Business requirements
├── Analisis de negocio/                        # Business analysis queries
│   ├── Analisis Clientes y pedido.txt         # Customer and order analysis
│   ├── Analisis productos y secciones.txt     # Product and section analysis
│   └── Analisis venta y tendencia.txt         # Sales and trend analysis
└── reglas.csv                                 # Generated association rules (output)
```

## Requirements and Dependencies

### Python Libraries
- `pandas` - Data manipulation and analysis
- `sqlite3` - Database connectivity
- `itertools` - Efficient looping tools for combinations

### Data Requirements
- SQLite database file: `sanoyfresco.db` (contains sales transaction data)
- Database should contain a `tickets` table with the following structure:
  - `id_pedido` (Order ID)
  - `id_cliente` (Customer ID)
  - `fecha` (Date)
  - `hora` (Hour)
  - `id_departamento` (Department ID)
  - `id_seccion` (Section ID)
  - `id_producto` (Product ID)
  - `nombre_producto` (Product Name)
  - `precio_unitario` (Unit Price)
  - `cantidad` (Quantity)
  - `precio_total` (Total Price)

## Installation and Setup

### 1. Environment Setup
```bash
# Create a virtual environment (recommended)
python -m venv venv

# Activate virtual environment
# On Linux/Mac:
source venv/bin/activate
# On Windows:
venv\Scripts\activate
```

### 2. Install Dependencies
```bash
# Install required packages
pip install pandas jupyter notebook

# Note: sqlite3 is included with Python standard library
```

### 3. Database Setup
1. Ensure you have the `sanoyfresco.db` SQLite database file
2. Place it in the same directory as the notebook
3. Verify the database contains the `tickets` table with proper structure

### 4. Launch Jupyter Notebook
```bash
# Start Jupyter Notebook
jupyter notebook

# Open TPE_MarketBasketAnalysis_colab.ipynb
```

## How to Run the Project

### Step 1: Database Connection
The notebook will automatically connect to the SQLite database:
```python
import sqlite3
import pandas as pd

# Connect to database
conexion = sqlite3.connect('sanoyfresco.db')
```

### Step 2: Data Loading and Preprocessing
- Load transaction data from the database
- Convert date formats
- Create market basket format (products per transaction)

### Step 3: Market Basket Analysis
- Transform data into binary matrix (product presence/absence per order)
- Calculate support for each product
- Generate product combinations and calculate association metrics

### Step 4: Association Rules Generation
- Calculate confidence and lift for product pairs
- Filter rules based on minimum confidence threshold (5%)
- Sort results by lift value for strongest associations

### Step 5: Results Export
The analysis generates a CSV file (`reglas.csv`) containing:
- Product associations (antecedent → consequent)
- Support, confidence, and lift metrics
- Product IDs and department/section information

## Key Analysis Outputs

### 1. Product Support Analysis
Shows the percentage of transactions containing each product, helping identify:
- Most popular products
- Product penetration rates
- Inventory optimization opportunities

### 2. Association Rules
Identifies product relationships with metrics:
- **Support**: How frequently products appear together
- **Confidence**: Probability of buying consequent given antecedent
- **Lift**: Strength of association (>1 indicates positive correlation)

### 3. Business Insights
The analysis provides insights for:
- Cross-selling strategies
- Product placement optimization
- Promotional bundling opportunities
- Inventory management

## Usage Tips

### For Business Users
1. Focus on high-lift associations (>2.0) for strong product relationships
2. Use high-confidence rules (>15%) for reliable cross-selling recommendations
3. Consider support levels to ensure statistical significance

### For Technical Users
1. Adjust confidence threshold in the code to filter rules
2. Modify the analysis to include temporal patterns
3. Extend to include customer segmentation analysis

### Performance Considerations
- The dataset contains ~5M transactions, processing may take several minutes
- Consider sampling for initial exploration with large datasets
- Ensure sufficient memory for data transformations

## Troubleshooting

### Common Issues

**Database Connection Error**
- Verify `sanoyfresco.db` file exists in the correct directory
- Check file permissions
- Ensure SQLite database is not corrupted

**Memory Issues**
- Reduce dataset size for testing
- Close other applications to free memory
- Consider processing data in chunks

**Missing Dependencies**
```bash
# Install missing packages
pip install pandas
```

**Jupyter Notebook Issues**
```bash
# Reinstall Jupyter if needed
pip install --upgrade jupyter notebook
```

## Business Value

This analysis provides actionable insights for:

1. **Revenue Optimization**: Identify high-value product combinations
2. **Customer Experience**: Improve product recommendations
3. **Inventory Management**: Optimize stock levels based on associations
4. **Marketing Strategy**: Design targeted promotional campaigns
5. **Store Layout**: Optimize product placement for increased sales

## Future Enhancements

- **Temporal Analysis**: Seasonal patterns and trends
- **Customer Segmentation**: RFM analysis and customer clustering
- **Predictive Modeling**: Demand forecasting
- **Real-time Dashboard**: Interactive visualization of key metrics
- **A/B Testing Framework**: Measure impact of recommendations

## Contact and Support

For questions or issues with this analysis:
1. Review the business analysis files in `Analisis de negocio/`
2. Check the functional requirements document
3. Examine the notebook comments for detailed explanations

---

**Note**: This project was developed for educational and business analysis purposes. Ensure data privacy and compliance with relevant regulations when working with customer transaction data.