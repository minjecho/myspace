# sample_seaborn.py
# seaborn 패키지 사용 시각화 테스트
# seaborn : matplotlib 기반 색상 테마와 통계용 챠트 기능 추가한 패키지임
# 기본 시각화 기능은 matplotlib 에 의존하고,
# 통계 기능은 statsmodels 패키지에 의존함
import matplotlib as mpl
import matplotlib.pyplot as plt
import matplotlib.font_manager as fm
import numpy as np
import seaborn as sns

# 1차원 분포 플롯 ----------------------------------
# 1차원 데이터가 실수값이면 히스토그램과 같은 실수 분포 플롯으로,
# 카테고리 값이면 카운트 플롯으로 표시됨

# 1. 샘플 데이터 로드함
iris = sns.load_dataset("iris") # 붓꽃 데이터
titanic = sns.load_dataset("titanic") # 타이타닉호 데이터
tips = sns.load_dataset("tips") # 팁 데이터
flights = sns.load_dataset("flights") # 여객운송 데이터

# 한글 글꼴 지정
mpl.rc('font', family='NanumGothic')
mpl.rc('axes', unicode_minus=False)

# 1차원 실수 분포 플롯 -------------
# 커널 밀도(kernel density), 러그(rug) 표시 기능, 다차원 복합 분포 기능
# regplot(), kdeplot(), distplot() 사용
# 러그 : x 축위의 작은 선분
x = iris.petal_length.values
# sns.rugplot(x)
# plt.title("Iris 데이터 중, 꽃잎의 길이에 대한 Rug Plot ")
# plt.show()

# 커널 밀도 추정 : kdeplot()
# sns.kdeplot(x)
# plt.title("Iris 데이터 중, 꽃잎의 길이에 대한 Kernel Density Plot")
# plt.show()

# 러그와 커널 밀도 표시 : distplot()
# sns.distplot(x, kde=True, rug=True)
# plt.title("Iris 데이터 중, 꽃잎의 길이에 대한 Dist Plot")
# plt.show()


# 카운트 플롯 ---------------------------------
# countplot() 사용 : 데이터프레임에만 사용할 수 있음
# 각 카테고리 값별로 데이터가 얼마나 있는지 표시할 수 있음
# countplot(x="column_name", data=dataframe)
# sns.countplot(x="class", data=titanic)
# plt.title("타이타닉호의 각 클래스별, 승객 수")
# plt.show()

# sns.countplot(x="day", data=tips)
# plt.title("요일별 팁을 준 횟수")
# plt.show()

# 다차원 데이터 -------------------------------
# 2차원 실수형 데이터 : jointplot() 사용 --------------
# jointplot(x="x_name", y="y_name", data=dataframe, kind='scatter')
# sns.jointplot(x="sepal_length", y="sepal_width", data=iris)
# plt.suptitle("꽃받침의 길이와 넓이의 Joint Plot", y=1.02)
# plt.show()

# kind='kde' 이면 커널 밀도 히스토그램을 그림
# sns.jointplot(x="sepal_length", y="sepal_width", data=iris, kind="kde")
# plt.suptitle("꽃받침의 길이와 넓이의 Joint Plot 과 Kernel Density Plot", y=1.02)
# plt.show()

# 다차원 실수형 데이터 (3차원 이상의 데이터인 경우) -------------
# pairplot() 사용
# sns.pairplot(iris)
# plt.title("Iris Data 의 Pair Plot")
# plt.show()

# 카테고리형 데이터가 섞여 있는 경우
# hue 인수에 카테고리 변수 이름 지정하면 카테고리별 색상을 다르게 함
# sns.pairplot(iris, hue="species", markers=["o", "s", "D"])
# plt.title("Iris Pair Plot, Hue 로 꽃의 종을 시각화")
# plt.show()

# 2차원 카테고리 데이터
# 데이터가 2차원이고 모든 값이 카테고리이면 heatmap() 사용
# titanic_size = titanic.pivot_table(index="class", columns="sex", aggfunc="size")
# print(titanic_size)
# sns.heatmap(titanic_size, cmap=sns.light_palette("gray", as_cmap=True), annot=True, fmt="d")
# plt.title("Heatmap")
# plt.show()


# 2차원 복합 데이터 ---------------------
# 2차원 데이터이고 실수값, 카테고리 값이 섞여 있는 경우
# 다음의 분포 플롯들을 이용할 수 있음
# • barplot
# • boxplot
# • pointplot
# • violinplot
# • stripplot
# • swarmplot

# barplot() ---------------------------------
# 카테고리 값에 따른 실수 값의 평균과 편차를 표시할 때 사용
# 평균은 막대의 높이로, 편차는 에러바로 표시함
# sns.barplot(x="day", y="total_bill", data=tips)
# plt.title("요일 별, 전체 팁")
# plt.show()

# boxplot() -------------------------------------
# 박스 위스커 플롯(box-whisker plot) or 박스 플롯
# 중앙값, 표준 편차 등 분포의 특성을 보여줄 때 사용함
# 박스와 박스 바깥의 선(whisker) 로 표현
# 박스 : 실수 값 분포에서 1사분위수(Q1)와 3사분위수(Q3) 뜻함
# IQR(InterQuartile Range) : Q3 - Q1
# 박스 내부 가로선 : 중앙값 나타냄
# 아웃라이어(outlier) : 바깥의 점
# sns.boxplot(x="day", y="total_bill", data=tips)
# plt.title("요일 별 전체 팁의 Box Plot")
# plt.show()

# sns.violinplot(x="day", y="total_bill", data=tips)
# plt.title("요일 별 전체 팁의 Violin Plot")
# plt.show()


# stripplot() --------------------------------------------
# 스캐터 플롯처럼 모든 데이터를 점으로 표시함
# jitter = True 설정 : 가로축 상의 위치를 무작위로 바꾸어 줌
# 데이터 수가 많을수록 점들이 겹치지 않도록 함
# np.random.seed(0)
# sns.stripplot(x="day", y="total_bill", data=tips, jitter=True)
# plt.title("요일 별 전체 팁의 Strip Plot")
# plt.show()


# swarmplot() ----------------------------------
# stripplot() 와 비숫하지만 점이 겹치지 않도록 옆으로 이동해서 표시함
# sns.swarmplot(x="day", y="total_bill", data=tips)
# plt.title("요일 별 전체 팁의 Swarm Plot")
# plt.show()


# 다차원 복합 데이터 ----------------------------------
# barplot() ------------
# sns.barplot(x="day", y="total_bill", hue="sex", data=tips)
# plt.title("요일 별, 성별 전체 팁의 Histogram")
# plt.show()

# boxplot() ------------
# sns.boxplot(x="day", y="total_bill", hue="sex", data=tips)
# plt.title("요일 별, 성별 전체 팁의 Box Plot")
# plt.show()

# violinplot() ----------------------------
# sns.violinplot(x="day", y="total_bill", hue="sex", data=tips)
# plt.title("요일 별, 성별 전체 팁의 Violin Plot")
# plt.show()

# stripplot() ----------------------------
# np.random.seed(0)
# sns.stripplot(x="day", y="total_bill", hue="sex", data=tips, jitter=True)
# plt.title("요일 별, 성별 전체 팁의 Strip Plot")
# plt.legend(loc=1)
# plt.show()


# swarmplot() ----------------------
# sns.swarmplot(x="day", y="total_bill", hue="sex", data=tips)
# plt.title("요일 별, 성별 전체 팁의 Swarm Plot")
# plt.legend(loc=1)
# plt.show()

# split, dodge 옵션으로 시각화 방법을 변경할 수도 있음
# sns.violinplot(x="day", y="total_bill", hue="sex", data=tips, split=True)
# plt.title("요일 별, 성별 전체 팁의 Violin Plot, Split=True")
# plt.show()

# sns.stripplot(x="day", y="total_bill", hue="sex", data=tips, jitter=True, dodge=True)
# plt.title("요일 별, 성별 전체 팁의 Strip Plot, Split=True")
# plt.show()

# sns.swarmplot(x="day", y="total_bill", hue="sex", data=tips, dodge=True)
# plt.title("요일 별, 성별 전체 팁의 Swarm Plot, Split=True")
# plt.show()

# heatmap() -------------------------------
# 두 개의 카테고리 값에 의한 실수값 변화 확인 표시
# flights_passengers = flights.pivot("month", "year", "passengers")
# plt.title("연도, 월 별 승객수에 대한 Heatmap")
# sns.heatmap(flights_passengers, annot=True, fmt="d", linewidths=1)
# plt.show()


# catplot() ------------------------
# 색상(hue)과 행(row) 등을 동시에 사용하여
# 3개 이상의 카테고리 값에 의한 분포 변화를 보여줌
# data = titanic[titanic.survived.notnull()]
# sns.catplot(x="age", y="sex", hue="survived", row="class", data=data, kind="violin", split=True, height=2, aspect=4)
# plt.title("각 클래스의 성별 생존자 수의 Catplot")
# plt.show()


# 기타 -----------------------------------------------
# 시각화 효과를 높이기 위해 여러 종류의 챠트를 겹쳐서 표시 가능
# plt.title("Boxplot 과 Strip Plot 로 표현한, 요일 별 팁")
# sns.boxplot(x="tip", y="day", data=tips, whis=np.inf)
# sns.stripplot(x="tip", y="day", data=tips, jitter=True, color="0.4")
# plt.show()

# plt.title("Violin plot 과 Swarm Plot 로 표현한, 요일 별 팁")
# sns.violinplot(x="day", y="total_bill", data=tips, inner=None)
# sns.swarmplot(x="day", y="total_bill", data=tips, color="0.9")
# plt.show()


# 스타일 ---------------------------------------
# seaborn 이 import 되면 matplotlib 스타일이 seaborn 스타일로 바뀜
# set() : 색상, 틱, 스타일 등을 바꿀 때 사용
# set_style() : 틱 스타일만 바꿀 때 사용,
#       darkgrid, whitegrid, dark, white, ticks 스타일을 제공
def sinplot(flip=1):
    x = np.linspace(0, 14, 100)
    for i in range(1, 7):
        plt.plot(x, np.sin(x + i * .5) * (7 - i) * flip)

# sns.set_style("ticks")
# sinplot()

# sns.set_style("darkgrid")
# sinplot()

sns.set_style("whitegrid")
sinplot()

plt.show()
