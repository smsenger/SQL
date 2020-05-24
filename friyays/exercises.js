
//given an array of 0s and 1s, count the number of 'islands of 1s' 
//(groups of connecting 1s)

// [1, 0, 1] = 2
// [0, 0, 1, 0, 1, 1, 0, 0, 1, 0] = 3


// function islands(array) {
//     let count = 0
//     for(let i = 0; i < array.length; i++) {
//         if (array[i] === 1 && array[i + 1] !== 1) {
//         count++;
//     };
// };
// return count;
// };
// console.log(islands([0, 1, 1, 0, 1, 0, 0, 1, 1, 1]));
// console.log(islands([1, 0, 1]));

//array of numbers, each element is price of stock and index = day.
//complete 1 transaction, design algorithm to find max profit.
//cannot sell a stock before buying one
//THREE SOLUTIONS

// [7, 1, 5, 3, 6, 4] -> 5
// [7, 6, 5, 3, 1] -> 0

//loop through array

//do this for every index in array -- loop

function stockBuy(array) {

    let buy = 0
    let sell = 0
    let profit = 0;

    buy = Math.min(...array);
    console.log(buy)

    let index = array.indexOf(buy);
    console.log(index)

    array = array.slice(index);
    sell = Math.max(...array)
    console.log(sell)
    
    profit = sell-buy;

    if (profit <= 0) {
        return 0;
    }

    return profit;
}


// console.log(stockBuy([7, 1, 5, 3, 6, 4]));
// console.log(stockBuy([7, 6, 5, 3, 1]));
// console.log(stockBuy([14, 84, 21, 72, 20, 54, 85, 68, 37, 52, 10, 58, 22, 4, 45, 90, 77, 70, 94, 9, 40, 69, 36, 88, 27, 16, 75, 79, 63, 12, 44, 67, 24, 28, 80, 65, 55, 15, 47, 35, 53, 82, 39, 7, 83, 29, 2, 73, 42, 97, 49, 87, 86, 31, 34, 51, 98, 76, 96, 89, 3, 92, 25, 33, 93, 23, 81, 91, 41, 19, 95, 1, 8, 57, 99, 66, 64, 62, 50, 30, 74, 17, 5, 18, 100, 43, 6, 11, 26, 32, 46, 38, 59, 60, 71, 61, 56, 78, 48, 13])) // 99 // 1684
// console.log(stockBuy([8, 7, 1, 3, 5]));
console.log(stockBuy([9, 7, 5, 3, 1, 0]));


// function profitSingle(prices) {
//     let maxProfit = 0;
//     let buy = prices[0];
//     for (let price of prices) {
//         if(sell < buy) {
//             buy = sell;
//         }
//         else if (sell - buy > maxProfit) {
//             maxProfit = sell - buy;
//         }
//     } return maxProfit
// }
// console.log(profitSingle([7, 1, 5, 3, 6, 4]));

// function stockBuy(prices) {
//     let maxProfit = 0;
//     for(let i = 0; i < prices.length; i++) {
//         for(let j = i + 1; j < prices.length; j++) {
//             let currentProfit = prices[j] - prices[i];
//             if(currentProfit > maxProfit); {
//             maxProfit = currentProfit
//             }
//         }
//     }
//     return maxProfit;
// }
// console.log(stockBuy([7, 6, 5, 3, 1]));

