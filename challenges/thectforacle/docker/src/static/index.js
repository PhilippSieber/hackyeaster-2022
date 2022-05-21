(function () {
  "use strict";

  const points2019 = document.getElementById("2019");
  const points2020 = document.getElementById("2020");
  const points2021 = document.getElementById("2021");
  const oracleResult = document.getElementById("oracleResult");
  const form = document.getElementById("ctf-form");
  const feedback = document.getElementById("feedback");

  form.addEventListener("submit", async (evt) => {
    evt.preventDefault();
    $(oracleResult).hide();

    const data = new FormData(form);
    data.delete("2019");
    data.delete("2020");
    data.delete("2021");
    points2019.value;
    data.append(
      "results",
      points2019.value + "," + points2020.value + "," + points2021.value
    );

    feedback.style.display = "none";
    const resp = await fetch("/predict", {
      method: "POST",
      body: data,
    });
    if (resp.ok) {
      const json = await resp.json();
      var res2022 = Math.round(json[0]);
      if (res2022 < 0) {
        res2022 = 0;
      }
      oracleResult.innerHTML = res2022;
      $(oracleResult).show();
    } else {
      feedback.style.display = "block";
      feedback.textContent = `Error: ${await resp.text()}`;
    }
  });
})();
