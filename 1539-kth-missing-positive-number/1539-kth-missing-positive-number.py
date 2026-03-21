class Solution:
    def findKthPositive(self, arr, k):
        current = 1
        i = 0
        
        while k > 0:
            if i < len(arr) and arr[i] == current:
                i += 1  # number exists in array
            else:
                k -= 1  # missing number found
            
            if k == 0:
                return current
            
            current += 1