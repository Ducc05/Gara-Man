(() => {
  const parseDate = (value) => {
    const match = /^(\d{2})\/(\d{2})\/(\d{4})$/.exec(value.trim());
    if (!match) return "";

    const [, dayText, monthText, yearText] = match;
    const day = Number(dayText);
    const month = Number(monthText);
    const year = Number(yearText);
    const date = new Date(year, month - 1, day);

    if (
      date.getFullYear() !== year ||
      date.getMonth() !== month - 1 ||
      date.getDate() !== day
    ) {
      return "";
    }

    return `${yearText}-${monthText}-${dayText}`;
  };

  const formatDate = (isoDate) => {
    const match = /^(\d{4})-(\d{2})-(\d{2})$/.exec(isoDate);
    return match ? `${match[3]}/${match[2]}/${match[1]}` : "";
  };

  document.querySelectorAll(".date-input").forEach((group) => {
    const textInput = group.querySelector("[data-date-text]");
    const isoInput = group.querySelector("[data-date-iso]");
    const datePicker = group.querySelector("[data-date-picker]");
    const pickerButton = group.querySelector("[data-date-button]");

    if (!textInput || !isoInput || !datePicker || !pickerButton) return;

    const syncTextInput = () => {
      const isoDate = parseDate(textInput.value);
      isoInput.value = isoDate;
      datePicker.value = isoDate;
      textInput.setCustomValidity(
        textInput.value.trim() && !isoDate
          ? "Nhập ngày hợp lệ theo dạng dd/MM/yyyy."
          : "",
      );
    };

    textInput.addEventListener("input", syncTextInput);
    textInput.addEventListener("blur", syncTextInput);

    datePicker.addEventListener("change", () => {
      textInput.value = formatDate(datePicker.value);
      syncTextInput();
    });

    pickerButton.addEventListener("click", () => {
      if (typeof datePicker.showPicker === "function") {
        datePicker.showPicker();
      } else {
        datePicker.focus();
        datePicker.click();
      }
    });

    syncTextInput();
  });
})();
