# python matplotlib 활용 시각화 테스트
import matplotlib as mpl
import matplotlib.pyplot as plt

# 간단한 plot(그래프) 그리기 : 선그래프 그리기
# [1, 4, 9, 16] 데이터 리스트 사용
# plt.title("Plot")
# plt.plot([1, 4, 9, 16])
# plt.show()

# 그래프 제목 설정 : title('표시할 제목')
# x축값도 함께 설정 : plot([x축 값들], [표시할 y축 값들])
# plt.title("x ticks")
# plt.plot([10, 20, 30, 40], [1, 4, 9, 16])
# plt.show()

# 한글폰트 사용을 위한 폰트 다운받아 압축 풀어줌 -------------
import matplotlib.font_manager as fm

print(mpl.matplotlib_fname())
# matplotlibrc 의 위치 확인 후, fonts/ttf 아래에 폰트파일 복사해 넣음

# matplotlib 캐시에 변경된 내용 반영함
print(mpl.get_cachedir()) 
# 캐시파일이 저장된 위치 확인하고, 해당 파일 삭제함
# 다시 실행하면 캐시 파일은 다시 생김
# 안 생기면 컴퓨터 리부팅함

# 폰트 설정
# 첫번째 방법 : rc parameter 를 설정하여 이후의 그림 전체에 적용

# 현재 적용되고 있는 폰트의 종류와 크기 확인
print(mpl.rcParams['font.family'])
print(mpl.rcParams['font.size'])

mpl.rc('font', family='NanumGothic')
# 유니코드에서 음수 부호설정
mpl.rc('axes', unicode_minus=False)

# 설정 글꼴 적용 확인
# plt.title('한글 제목')
# plt.plot([10, 20, 30, 40], [1, 4, 9, 16])
# plt.xlabel("엑스축 라벨")
# plt.ylabel("와이축 라벨")
# plt.show()

# 특정 부분만 글꼴 설정 변경
# path = 'C:/Windows/Fonts/나눔고딕.ttf'
# fontprop = fm.FontProperties(fname=path)
# plt.title('예시 graph', fontproperties=fontprop)
# plt.plot([10, 20, 30, 40], [1, 4, 9, 16])
# plt.xlabel('이것은 엑스축')
# plt.ylabel('이것은 와이축')
# plt.show()

# 각 객체마다 별도의 폰트 적용 : fontdict 인수에 넣어서 사용
# font1 = {'family': 'NanumMyeongjo', 'size': 24, 'color': 'black'}
# font2 = {'family': 'NanumBarunpen', 'size': 18, 'weight': 'bold', 'color': 'darkred'}
# font3 = {'family': 'NanumBarunGothic', 'size': 12, 'weight': 'light', 'color': 'blue'}
#
# plt.plot([10, 20, 30, 40], [1, 4, 9, 16])
# plt.title('한글 제목', fontdict=font1)
# plt.xlabel('엑스 축', fontdict=font2)
# plt.ylabel('와이 축', fontdict=font3)
# plt.show()

# 스타일 지정 : plot() 에 추가 문자열 인수를 사용함
# plt.title("'rs--' 스타일의 plot ")
# plt.plot([10, 20, 30, 40], [1, 4, 9, 16], 'rs--')
# plt.show()

# 스타일 지정 2
# plt.plot([10, 20, 30, 40], [1, 4, 9, 16], c="b", lw=5, ls="--", marker="o", ms=15, mec="g", mew=5, mfc="r")
# plt.title("스타일 적용 예")
# plt.show()

# 그래프 그림 범위 지정 : xlim(min, max), ylim(min, max) 사용
# plt.title("x 축, y 축의 범위 설정")
# plt.plot([10, 20, 30, 40], [1, 4, 9, 16], c="b", lw=5, ls="--", marker="o", ms=15, mec="g", mew=5, mfc="r")
# plt.xlim(0, 50)
# plt.ylim(-10, 30)
# plt.show()

# 틱(tick) 설정 : xticks(), yticks() 사용
# tick : 축상의 위치 표시 지점
import numpy as np

# X = np.linspace(-np.pi, np.pi, 256)
# C = np.cos(X)
# plt.title("x 축과 y 축의 tick label 설정")
# plt.plot(X, C)
# plt.xticks([-np.pi, -np.pi / 2, 0, np.pi / 2, np.pi])
# plt.yticks([-1, 0, +1])
# plt.show()

# 틱라벨 문자열에 LaTeX 수학 문자식을 넣을 수도 있음 : $수학문자식$
# X = np.linspace(-np.pi, np.pi, 256)
# C = np.cos(X)
# plt.title("LaTeX, 문자열로 tick label 정의")
# plt.plot(X, C)
# plt.xticks([-np.pi, -np.pi / 2, 0, np.pi / 2, np.pi], [r'$-\pi$', r'$-\pi/2$', r'$0$', r'$+\pi/2$', r'$+\pi$'])
# plt.yticks([-1, 0, 1], ["Low", "Zero", "High"])
# plt.show()

# Figure 영역에 그리드 설정하기 : grid()
# X = np.linspace(-np.pi, np.pi, 256)
# C = np.cos(X)
# plt.title("Grid 제거")
# plt.plot(X, C)
# plt.xticks([-np.pi, -np.pi / 2, 0, np.pi / 2, np.pi], [r'$-\pi$', r'$-\pi/2$', r'$0$', r'$+\pi/2$', r'$+\pi$'])
# plt.yticks([-1, 0, 1], ["Low", "Zero", "High"])
# plt.grid(False)  # grid 제거, true : 그리드 표시
# plt.show()

# 라인플롯(선그래프)에 여러 개의 선 표시하기
#plot(x-data, y-data, style, x-data, y-data, style, ... 반복사용)
# t = np.arange(0., 5., 0.2)
# plt.title("라인 플롯에서 여러개의 선 그리기")
# plt.plot(t, t, 'r--', t, 0.5 * t**2, 'bs:', t, 0.2 * t**3, 'g^-')
# plt.show()

# plot 겹쳐 그리기
# plt.title("복수의 plot 명령을 한 그림에서 표현")
# plt.plot([1, 4, 9, 16], c="b", lw=5, ls="--", marker="o", ms=15, mec="g", mew=5, mfc="r")
# # plt.hold(True) # <- 1,5 버전에서는 이 코드가 필요하다.
# plt.plot([9, 16, 4, 1], c="k", lw=3, ls=":", marker="s", ms=10, mec="m", mew=5, mfc="c")
# # plt.hold(False) # <- 1,5 버전에서는 이 코드가 필요하다.
# plt.show()

# legend(범례) 표시
# X = np.linspace(-np.pi, np.pi, 256)
# C, S = np.cos(X), np.sin(X)
# plt.title("legend 를 표시한 플롯")
# plt.plot(X, C, ls="--", label="cosine")
# plt.plot(X, S, ls=":", label="sine")
# plt.legend(loc=2)
# plt.show()

# 곡선 그래프에서 x축라벨, y축라벨, 타이틀 표시
# X = np.linspace(-np.pi, np.pi, 256)
# C, S = np.cos(X), np.sin(X)
# plt.plot(X, C, label="cosine")
# plt.xlabel("time")
# plt.ylabel("amplitude")
# plt.title("Cosine Plot")
# plt.show()

# figure 객체 : 그래프 그림그리기 영역
# 주로 plot() 사용함.
# np.random.seed(0)
# f1 = plt.figure(figsize=(10, 2))
# plt.title("figure size : (10, 2)")
# plt.plot(np.random.randn(100))
# plt.show()

# gcf() : 현재 사용하고 있는 figure 객체 얻어옴
# f1 = plt.figure(1)
# plt.title("현재의 Figure 객체")
# plt.plot([1, 2, 3, 4], 'ro:')
# f2 = plt.gcf()
# print(f1, id(f1))
# print(f2, id(f2))
# plt.show()

# Axes 객체 : 그래프선 객체
# x축과 y축을 포함함
# subplot() 사용하여 생성함
# plt.subplot(2, 1, 1)
# 여기에서 윗부분에 그릴 플롯 명령 실행
# plt.subplot(2, 1, 2)
# 여기에서 아랫부분에 그릴 플롯 명령 실행

# tight_layout() : 플롯 간의 간격을 자동으로 맞춰줌
# x1 = np.linspace(0.0, 5.0)
# x2 = np.linspace(0.0, 2.0)
# y1 = np.cos(2 * np.pi * x1) * np.exp(-x1)
# y2 = np.cos(2 * np.pi * x2)
# ax1 = plt.subplot(2, 1, 1)
# plt.plot(x1, y1, 'yo-')
# plt.title('A tale of 2 subplots')
# plt.ylabel('Damped oscillation')
# ax2 = plt.subplot(2, 1, 2)
# plt.plot(x2, y2, 'r.-')
# plt.xlabel('time (s)')
# plt.ylabel('Undamped')
# plt.tight_layout()
# plt.show()

# 2 X 2 형태의 4개의 플롯 작성일 경우
# np.random.seed(0)
# plt.subplot(221)
# plt.plot(np.random.rand(5))
# plt.title("axes 1")
# plt.subplot(222)
# plt.plot(np.random.rand(5))
# plt.title("axes 2")
# plt.subplot(223)
# plt.plot(np.random.rand(5))
# plt.title("axes 3")
# plt.subplot(224)
# plt.plot(np.random.rand(5))
# plt.title("axes 4")
# plt.tight_layout()
# plt.show()

# subplot() 으로 복수의 Axes 객체 생성하는 경우
# 2차원 ndarray 형태로 Axes 객체가 반환됨
# fig, axes = plt.subplots(2, 2)
# np.random.seed(0)
# axes[0, 0].plot(np.random.rand(5))
# axes[0, 0].set_title("axes 1")
# axes[0, 1].plot(np.random.rand(5))
# axes[0, 1].set_title("axes 2")
# axes[1, 0].plot(np.random.rand(5))
# axes[1, 0].set_title("axes 3")
# axes[1, 1].plot(np.random.rand(5))
# axes[1, 1].set_title("axes 4")
# plt.tight_layout()
# plt.show()


# 하나의 Axes 객체는 2개 이상의 Axis(축) 객체를 가짐
# x축, y축을 의미하는 객체임
# twinx() : 2개의 y축을 표시할 때 사용
# fig, ax0 = plt.subplots()
# ax1 = ax0.twinx()
# ax0.set_title("2 개의 y 축 한 figure 에서 사용하기")
# ax0.plot([10, 5, 2, 9, 7], 'r-', label="y0")
# ax0.set_ylabel("y0")
# ax0.grid(False)
# ax1.plot([100, 200, 220, 180, 120], 'g:', label="y1")
# ax1.set_ylabel("y1")
# ax1.grid(False)
# ax0.set_xlabel("공유되는 x 축")
# plt.show()

# 바(bar) 챠트 만들기 -------------------
# y = [2, 3, 1]
# x = np.arange(len(y))
# xlabel = ['가', '나', '다']
# plt.title("Bar Chart")
# plt.bar(x, y)
# plt.xticks(x, xlabel)
# plt.yticks(sorted(y))
# plt.xlabel("가나다")
# plt.ylabel("빈도 수")
# plt.show()


# xerr, yerr 인수를 지정하면 에러 바(error bar) 추가할 수 있음
# alpha (투명도) : 1- 불투명, 0 - 투명
# np.random.seed(0)
# people = ['몽룡', '춘향', '방자', '향단']
# y_pos = np.arange(len(people))
# performance = 3 + 10 * np.random.rand(len(people))
# error = np.random.rand(len(people))
# plt.title("Barh Chart")
# plt.barh(y_pos, performance, xerr=error, alpha=0.4)
# plt.yticks(y_pos, people)
# plt.xlabel('x 라벨')
# plt.show()


# 스탬 플롯(stem plot) : 너비가 없는 바 플롯
# 이산 확률 함수나 자기상관관계 표시에 사용
# x = np.linspace(0.1, 2 * np.pi, 10)
# plt.title("Stem Plot")
# plt.stem(x, np.cos(x), '-.')
# plt.show()


# 파이 챠트 ---------------------------------------
# 주의 : 원의 형태를 유지할 수 있도록 하기 위해
# plt.axis('equal') 을 실행해야 함
# labels = ['개구리', '돼지', '개', '통나무']
# sizes = [15, 30, 45, 10]
# colors = ['yellowgreen', 'gold', 'lightskyblue', 'lightcoral']
# explode = (0, 0.1, 0, 0)
# plt.title("Pie Chart")
# plt.pie(sizes, explode=explode, labels=labels, colors=colors, autopct='%1.1f%%', shadow=True, startangle=90)
# plt.axis('equal')
# plt.show()


# 히스토그램 : hist()  ----------------------------
# bins : 데이터를 집계할 구간 정보
# 집계결과가 반환됨
# np.random.seed(0)
# x = np.random.randn(1000)
# plt.title("Histogram")
# arrays, bins, patches = plt.hist(x, bins=10)
# plt.show()


# 스캐터 플롯 ---------------------------------
# 점 분포 그래프
# scatter() 사용, 점의 x, y 좌표 필요
# np.random.seed(0)
# X = np.random.normal(0, 1, 100)
# Y = np.random.normal(0, 1, 100)
# plt.title("Scatter Plot")
# plt.scatter(X, Y)
# plt.show()


# 버블 챠트 (bubble chart) : 점의 크기와 색상을 이용 3, 4차원 표시
# 크기 : s , 색상 : c
# N = 30
# np.random.seed(0)
# x = np.random.rand(N)
# y1 = np.random.rand(N)
# y2 = np.random.rand(N)
# y3 = np.pi * (15 * np.random.rand(N))**2
# plt.title("Bubble Chart")
# plt.scatter(x, y1, c=y2, s=y3)
# plt.show()


# imshow() ------------------------------------
# 2차원 자료의 크기를 색깔로 표시할 때 사용
# 행렬 형태의 2차원 데이터를 사용함
# sklearn 패키지 추가해서 행렬 데이터 구함
from sklearn.datasets import load_digits
digits = load_digits()
X = digits.images[0]
print(X)

# plt.title("mnist digits; 0")
# plt.imshow(X, interpolation='nearest', cmap=plt.cm.bone_r)
# plt.xticks([])
# plt.yticks([])
# plt.grid(False)
# plt.subplots_adjust(left=0.35, right=0.65, bottom=0.35, top=0.65)
# plt.show()


# 칼라맵(color map) : 데이터 수치를 색으로 바꾸는 함수
# cmap 인수 지정함, plt.cm 속성
# dir(plt.cm)[:10]
# fig, axes = plt.subplots(1, 4, figsize=(12, 3), subplot_kw={'xticks': [], 'yticks': []})
# axes[0].set_title("plt.cm.Blues")
# axes[0].imshow(X, interpolation='nearest', cmap=plt.cm.Blues)
# axes[1].set_title("plt.cm.Blues_r")
# axes[1].imshow(X, interpolation='nearest', cmap=plt.cm.Blues_r)
# axes[2].set_title("plt.BrBG")
# axes[2].imshow(X, interpolation='nearest', cmap='BrBG')
# axes[3].set_title("plt.BrBG_r")
# axes[3].imshow(X, interpolation='nearest', cmap='BrBG_r')
# plt.show()

# imshow() -----------------------------
# 자료의 시각화를 돕기 위한 다양한 2차원 인터플레이션을 지원함
# methods = [None, 'none', 'nearest', 'bilinear', 'bicubic', 'spline16',
#            'spline36', 'hanning', 'hamming', 'hermite', 'kaiser', 'quadric',
#            'catrom', 'gaussian', 'bessel', 'mitchell', 'sinc', 'lanczos']
# fig, axes = plt.subplots(3, 6, figsize=(12, 6), subplot_kw={'xticks': [], 'yticks': []})
# for ax, interp_method in zip(axes.flat, methods):
#     ax.imshow(X, cmap=plt.cm.bone_r, interpolation=interp_method)
#     ax.set_title(interp_method)
# plt.show()


# 컨투어 플롯 (contour plot) : 등고선 그래프 -------------------
# 3 차원 자료를 시각화할 때 사용
# contour() : 등고선만 표시, contourf() : 색깔로 표시
# x, y는 meshgrid() 를 사용하여 그리드 포인트 행렬을 만들어야 함
# def f(x, y):
#     return (1 - x / 2 + x ** 5 + y ** 3) * np.exp(-x ** 2 - y ** 2)
#
# n = 256
# x = np.linspace(-3, 3, n)
# y = np.linspace(-3, 3, n)
# XX, YY = np.meshgrid(x, y)
# ZZ = f(XX, YY)
# plt.title("Contour plots")
# plt.contourf(XX, YY, ZZ, alpha=.75, cmap='jet')
# plt.contour(XX, YY, ZZ, colors='black')
# plt.show()


# 3D surface plot ---------------------------------
# 등고선 플롯과 다르게 Axes3D 라는 3차원 전용 axes 객체를 생성함
from mpl_toolkits.mplot3d import Axes3D

# X = np.arange(-4, 4, 0.25)
# Y = np.arange(-4, 4, 0.25)
# XX, YY = np.meshgrid(X, Y)
# RR = np.sqrt(XX**2 + YY**2)
# ZZ = np.sin(RR)
# fig = plt.figure()
# ax = Axes3D(fig)
# ax.set_title("3D Surface Plot")
# ax.plot_surface(XX, YY, ZZ, rstride=1, cstride=1, cmap='hot')
# plt.show()


# 삼각형 그리드 사용하기 ----------------------------
import matplotlib.tri as mtri

# x = np.array([0, 1, 2])
# y = np.array([0, np.sqrt(3), 0])
# triangles = [[0, 1, 2]]
# triang = mtri.Triangulation(x, y, triangles)
# plt.title("삼각 그리드")
# plt.triplot(triang, 'ko-')
# plt.xlim(-0.1, 2.1)
# plt.ylim(-0.1, 1.8)
# plt.show()

# 삼각형 그리드 세분화 1
# x = np.asarray([0, 1, 2, 3, 4, 2])
# y = np.asarray([0, np.sqrt(3), 0, np.sqrt(3), 0, 2*np.sqrt(3)])
# triangles = [[0, 1, 2], [2, 3, 4], [1, 2, 3], [1, 3, 5]]
# triang = mtri.Triangulation(x, y, triangles)
# plt.title("여러개의 삼각형 그리기")
# plt.triplot(triang, 'ko-')
# plt.xlim(-0.1, 4.1)
# plt.ylim(-0.1, 3.7)
# plt.show()


# 삼각형 그리드 세분화 2
# TriRefiner or UniformTriRefiner 클래스 사용
# x = np.asarray([0, 1, 2, 3, 4, 2])
# y = np.asarray([0, np.sqrt(3), 0, np.sqrt(3), 0, 2*np.sqrt(3)])
# triangles = [[0, 1, 2], [2, 3, 4], [1, 2, 3], [1, 3, 5]]
# triang = mtri.Triangulation(x, y, triangles)
# refiner = mtri.UniformTriRefiner(triang)
# triang2 = refiner.refine_triangulation(subdiv=2)
# plt.title("그리드 세분화")
# plt.triplot(triang2, 'ko-')
# plt.xlim(-0.1, 4.1)
# plt.ylim(-0.1, 3.7)
# plt.show()


# 그리드 플롯 : 그리드상에 tricontourf, plot_trisur, plot_trisurf 사용
# 2차원 등고선 플롯이나 3차원 surface plot 을 그릴 수 있음
# x = np.asarray([0, 1, 2, 3, 4, 2])
# y = np.asarray([0, np.sqrt(3), 0, np.sqrt(3), 0, 2*np.sqrt(3)])
# triangles = [[0, 1, 2], [2, 3, 4], [1, 2, 3], [1, 3, 5]]
# triang = mtri.Triangulation(x, y, triangles)
# refiner = mtri.UniformTriRefiner(triang)
# triang5 = refiner.refine_triangulation(subdiv=5)
# z5 = np.cos(1.5*triang5.x)*np.cos(1.5*triang5.y)
# plt.title("삼각 그리드에서의 3 차원 데이터 시각화")
# plt.tricontourf(triang5, z5, cmap="gray")
# plt.show()

# 3차원 surface plot
from mpl_toolkits.mplot3d import Axes3D
from matplotlib import cm

x = np.asarray([0, 1, 2, 3, 4, 2])
y = np.asarray([0, np.sqrt(3), 0, np.sqrt(3), 0, 2*np.sqrt(3)])
triangles = [[0, 1, 2], [2, 3, 4], [1, 2, 3], [1, 3, 5]]
triang = mtri.Triangulation(x, y, triangles)
refiner = mtri.UniformTriRefiner(triang)
triang3 = refiner.refine_triangulation(subdiv=3)
z3 = np.cos(1.5 * triang3.x) * np.cos(1.5 * triang3.y)
fig = plt.figure()
ax = fig.gca(projection='3d')
ax.set_title("삼각 그리드에서의 3D Surface Plot")
ax.plot_trisurf(triang3.x, triang3.y, z3, cmap=cm.jet, linewidth=0.2)
ax.tricontourf(triang3, z3, zdir='z', offset=-1.2, cmap=cm.coolwarm)
ax.set_zlim(-1, 1)
ax.view_init(40, -40)
plt.show()