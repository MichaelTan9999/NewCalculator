//
//  judge.cpp
//  NewCalculator
//
//  Created by Michael Tan on 2019/3/21.
//  Copyright © 2019 Michael Tan. All rights reserved.
//



#include <iostream>
#include <vector>
#include <string>
#include <utility>
#include <cmath>
#include "calculator.hpp"
#include "judge.hpp"

using namespace std;

vector<pair<string, int>> word;
string expr;

int idx = 1;
int sym;
int err = 0; // 错误

void T();
void F();
void X();
/*--------------------------------词法分析----------------------------*/
int word_analysis(vector<pair<string, int>>& word, string expr)
{
    //删除 开放sqrt 中qrt字符串
    int pos = 0;
    while ((pos = static_cast<int>(expr.find("qrt"))) != -1)
    {
        expr.erase(pos, 3);
    }
    int po = 0;
    while ((po = static_cast<int>(expr.find('\0'))) != -1)
    {
        expr.erase(po, 1);
    }

    word.push_back(make_pair(" ", 0));
    for (int i = 0; i < expr.length(); ++i)
    {
        // 如果是 + - * / ( ) ^
        if (expr[i] == '(' || expr[i] == ')' || expr[i] == '+'
            || expr[i] == '-' || expr[i] == '*' || expr[i] == '/'
            || expr[i] == '^' || expr[i] == 'S')
        {
            string tmp;
            tmp.push_back(expr[i]);
            switch (expr[i])
            {
                case '+':
                    word.push_back(make_pair(tmp, 1));
                    break;
                case '-':
                    word.push_back(make_pair(tmp, 2));
                    break;
                case '*':
                    word.push_back(make_pair(tmp, 3));
                    break;
                case '/':
                    word.push_back(make_pair(tmp, 4));
                    break;
                case '(':
                    word.push_back(make_pair(tmp, 6));
                    break;
                case ')':
                    word.push_back(make_pair(tmp, 7));
                    break;
                case '^':
                    word.push_back(make_pair(tmp, 8));
                    break;
                case 'S':
                    word.push_back(make_pair(tmp, 9));
                    break;
            }
        }
        // 如果是数字开头
        else if (expr[i] >= '0' && expr[i] <= '9' )
        {
            string tmp;
            while (expr[i] >= '0' && expr[i] <= '9')
            {
                tmp.push_back(expr[i]);
                ++i;
            }
            if (expr[i] == '.')
            {
                ++i;
                if (expr[i] >= '0' && expr[i] <= '9')
                {
                    tmp.push_back('.');
                    while (expr[i] >= '0' && expr[i] <= '9')
                    {
                        tmp.push_back(expr[i]);
                        ++i;
                    }
                }
                else
                {
                    return -1;  // .后面不是数字，词法错误
                }
            }
            word.push_back(make_pair(tmp, 5));
            --i;
        }
        // 如果以.开头
        else
        {
            return -1;  // 以.开头，词法错误
        }
        
    }
    for (int i = 1; i < word.size(); ++i)
    {
        if (word[i].second == 9)
        {
            if (word[i + 1].second != 6)
                return -1;    //根号后面必须跟左括号
            if (word[i - 1].second == 5)
                return -1;    //根号前面必须是符号
        }
    }
    
    return 0;
}
/*--------------------------------语法分析----------------------------*/
// 读下一单词的种别编码
void Next()
{
    if (idx < word.size())
        sym = word[idx++].second;
    else
        sym = 0;
}

// E → T { +T | -T }
void E()
{
    T();
    while (sym == 1 || sym == 2)
    {
        Next();
        T();
    }
}

// T → F { *F | /F }
void T()
{
    F();
    while (sym == 3 || sym == 4)
    {
        Next();
        F();
    }
}

// F→    X { ^F | sqrtF }
void F()
{
    X();
    while (sym == 8 || sym == 9)
    {
        Next();
        X();
    }
}

// X → (E) | d
void X()
{
    if (sym == 5)
    {
        Next();
    }
    else if (sym == 6)
    {
        Next();
        E();
        if (sym == 7)
        {
            Next();
        }
        else
        {
            err = -1;
        }
    }
    else if (sym == 2)
    {
        if (word[idx - 2].second != 6) {
            err = -1;
        }
    }
    else if (sym == 9)
    {
        if (word[idx - 2].second == 5) {
            err = -1;
        }
    }
    else
    {
        err = -1;
    }
}

void initTest()
{
    idx = 1;
    err = 0;
    sym = 0;
    word.clear();
    return;
}
// This is the part that needs running every run!

string proc(string expr)
{
    initTest();
    int err_num = word_analysis(word, expr);
    if (-1 == err_num)
    {
        cout<<"Error No.1 with err_num = -1"<<endl;
        return "Wrong Expression.";
    }
    else
    {
        // 测试输出
        Next();
        E();
        if (sym == 0 && err == 0)  // 注意要判断两个条件
        {
            try
            {
                cout<<"The expr \'"<<expr<<"\' is going to getInfo()"<<endl;
                double tmp = getInfo(expr);
                if (isinf(tmp) || isnan(tmp)) {
                    cout<<"Error No.2 with something about isinf() or isnan()"<<endl;
                    return "Wrong Expression.";
                }
                else {
                    expr = "";
                    return to_string(tmp);
                    //the correct answer here
                }
            }
            catch (exception e)
            {
                cout<<"Error No.3 with catch"<<endl;
                return "Wrong Expression.";
            }
        }
        else
        {
            cout<<"Error No.4 with the last else part"<<endl;
            return "Wrong Expression.";
        }
    }
    return 0;
}
