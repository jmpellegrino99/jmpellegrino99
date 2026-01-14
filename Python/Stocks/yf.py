import streamlit as st
import yfinance as yf
import pandas as pd
import plotly.express as px

def get_stock_data(ticker):
    stock = yf.Ticker(ticker)
    hist = stock.history(period="6mo")
    return stock, hist

def main():
    st.title("Stock Market Dashboard")
    ticker = st.text_input("Enter Stock Ticker (e.g., AAPL, TSLA, GOOG):", "AAPL").upper()
    
    if ticker:
        stock, hist = get_stock_data(ticker)
        st.subheader(f"Stock: {stock.info['shortName']}")
        
        # Display latest price
        st.metric(label="Latest Price", value=f"${stock.history(period='1d')['Close'].iloc[-1]:.2f}")
        
        # Plot historical data
        fig = px.line(hist, x=hist.index, y='Close', title=f'{ticker} Stock Price Over 6 Months')
        st.plotly_chart(fig)
        
        # Display basic stock info
        st.subheader("Stock Statistics")
        stats = {
            "Market Cap": stock.info.get("marketCap", "N/A"),
            "52-Week High": stock.info.get("fiftyTwoWeekHigh", "N/A"),
            "52-Week Low": stock.info.get("fiftyTwoWeekLow", "N/A"),
            "PE Ratio": stock.info.get("trailingPE", "N/A"),
            "Dividend Yield": stock.info.get("dividendYield", "N/A"),
        }
        st.json(stats)

if __name__ == "__main__":
    main()
