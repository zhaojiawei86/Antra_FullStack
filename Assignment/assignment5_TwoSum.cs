// LeetCode 1: Two Sum

public class Solution {
    // Solution 1: Brute Force 
    // Time: O(n^2)
    public int[] TwoSum1(int[] nums, int target) {
        for (int i = 0; i < nums.Length - 1; i++) 
        {
            for (int j = i + 1; j < nums.Length; j++)
            {
                if (nums[i] + nums[j] == target)
                    return new int[]{i, j};
            }
        }
        return new int[2];
    }
    
    // Solution 2: Two Pointers O(nlgn)
    public int[] TwoSum2(int[] nums, int target) 
    {
        int[] index = new int[nums.Length];
        nums.CopyTo(index, 0);
        Array.Sort(nums);
        int i = 0;
        int j = nums.Length - 1;
        while (i < j) 
        {
            if (nums[i] + nums[j] == target)
                break;
            else if (nums[i] + nums[j] < target)
                i++;
            else
                j--;
        }
        int x = 0, y = 0;
        for (int k = 0; k < nums.Length; k++) 
        {
            if (index[k] == nums[i] && x == 0)
            {
                x = 1;
                i = k;
            }
            else if (index[k] == nums[j] && y == 0)
            {
                y = 1;
                j = k;
            }
            if (x == 1 && y == 1)
                return new int[] {i, j};
        }
        return new int[2];
    }
    
    // Solution 3: Dictionary 
    // Time: O(n)
    public int[] TwoSum3(int[] nums, int target) {
        Dictionary<int, int> dict = new Dictionary<int, int>();
        for (int i = 0; i < nums.Length; i++) 
        {
            if (!dict.ContainsKey(target - nums[i]))
            {
                if (!dict.ContainsKey(nums[i]))
                    dict.Add(nums[i], i);
            }
            else
                return new int[]{dict[target- nums[i]], i};
        }
        return new int[2];
    }
    
}
