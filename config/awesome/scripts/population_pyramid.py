import matplotlib.pyplot as plt
import pandas as pd
from matplotlib.font_manager import FontProperties

age = ["0-4", "5-9", "10-14", "15-19", "20-24", "25-29", "30-34", "35-39", "40-44", "45-49", "50-54", "55-59",
       "60-64", "65-69", "70-74", "75-79", "80-84", "85-89", "90+"]
male = [3, 3.3, 3.4, 3.2, 3, 3.3, 3.7, 3.9, 3.5, 3.1, 3.4, 2.8, 2.4, 2.1, 1.8, 1.4, 0.8, 0.4, 0.1]
female = [2.9, 3.1, 3.2, 3, 3, 3.4, 3.9, 4, 3.6, 3.2, 3.5, 2.9, 2.5, 2.3, 2.2, 2, 1.4, 0.9, 0.5]

population_df = pd.DataFrame({"Age": age, "Male": male, "Female": female})

population_df["Female_Left"] = 0
population_df["Female_Width"] = population_df["Female"]

population_df["Male_Left"] = -population_df["Male"]
population_df["Male_Width"] = population_df["Male"]


fig = plt.figure(facecolor="#3b4252", figsize=(10,20))
ax = plt.axes()
ax.set_facecolor("#3b4252")
ax.xaxis.label.set_color("#5e81ac")
ax.yaxis.label.set_color("#5e81ac")
for axis in ['top', 'bottom', 'left', 'right']:
  ax.spines[axis].set_color("#3b4252")

plt.barh(y=population_df["Age"], width=population_df["Female_Width"], color="#88c0d0", label="Female");
plt.barh(y=population_df["Age"], width=population_df["Male_Width"], left=population_df["Male_Left"], color="#5e81ac", label="Male");

plt.text(-5, 17, "Male", fontsize=25, fontweight="bold", color="#5e81ac");
plt.text(4, 17, "Female", fontsize=25, fontweight="bold", color="#88c0d0");

for idx in range(len(population_df)):
    plt.text(x=population_df["Male_Left"][idx]-0.1, y=idx, s="{} %".format(population_df["Male"][idx]), ha="right", va="center", fontsize=20, color="#5e81ac");
    plt.text(x=population_df["Female_Width"][idx]+0.1, y=idx, s="{} %".format(population_df["Female"][idx]), ha="left", va="center", fontsize=20, color="#88c0d0");

plt.xticks(range(-7,8), ["{}".format(i) for i in range(-7,8)]);
font_properties = FontProperties(weight='bold', size=20)
for label in ax.get_xticklabels():
    label.set_fontproperties(font_properties)
for label in ax.get_yticklabels():
    label.set_fontproperties(font_properties)

ax.tick_params(axis='x', colors="#88c0d0")
ax.tick_params(axis='y', colors="#88c0d0")

plt.grid(False);

plt.title("US Population Pyramid Chart", loc="left", pad=20, fontsize=25, fontweight="bold", color="#88c0d0");

plt.savefig('../pictures/tmp.png')
