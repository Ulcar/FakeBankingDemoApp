//
//  Assignment.swift
//  DemoAppWasTaken
//
//  Created by Schilperoort, L. (Lucas) on 17/10/2024.
//

import Foundation




public func TestIfArraysHaveTheSameFirstAndLastElement<T>(a:[T], b:[T]) -> Bool where T:Equatable
{
    if(a.count < 1 || b.count < 1)
    {
        return false
    }
    
    
    if(a[0] == b[0] && a.last == b.last)
    {
        return true
    }
    
    return false
}

public func CreateArrayFromInputArrays<T>(a:[T], b:[T]) -> [T]
{
    var outputArr = [T]()
    if(a.count < 3 || b.count < 3)
    {
        return outputArr
    }
   
     
    outputArr.append(a[a.count / 2 - (1 - a.count % 2)])
    if(a.count % 2 == 0)
    {
        outputArr.append(a[a.count / 2])
    }
    outputArr.append(b[b.count / 2 - (1 - b.count % 2)])
    
    if(b.count % 2 == 0)
    {
        outputArr.append(b[b.count / 2])
    }
    
    
    return outputArr
    
}
