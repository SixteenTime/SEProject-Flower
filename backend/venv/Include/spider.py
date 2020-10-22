
# Created by Hile_Meow
# 2020/10/22 1:57

import codecs
import re
from bs4 import BeautifulSoup as bs
from urllib import request
import urllib.parse
import string
import random

def getPoemByWord(word):
    word=urllib.parse.quote(word)
    url="https://www.shicimingju.com/chaxun/shiju/%s"%word
    resp=request.urlopen(url)
    htmlData=resp.read().decode("utf-8")
    soup=bs(htmlData,"html.parser")
    selectPoem=soup.find_all('a',target="_blank")
    resultList=[]
    for it in selectPoem:
        pattern=r"/chaxun/list/"
        match=re.match(pattern,it['href'])
        if match!=None:
            resultList.append("https://www.shicimingju.com"+it['href'])
    return resultList

def getSentenceFromPoem(word,poems):
    result=""
    poem=random.choice(poems)
    url = poem
    resp = request.urlopen(url)
    htmlData = resp.read().decode("utf-8")
    soup = bs(htmlData, "html.parser")
    sentence = soup.find_all('div', id="zs_content")
    pattern=">[\u4E00-\u9FA5]+<"#中文获取有问题 待改进
    regex=re.compile(pattern)
    match=regex.findall(poem)
    print(match)
    return result

def main():
    #从api获取识别结果
    word="桂花"
    #获取对应主题诗词连接
    poems=getPoemByWord(word)
    #随机获取诗句
    sentenceList=getSentenceFromPoem(word,poems)
    #把诗句返回前端 待补
    #Todo
main()