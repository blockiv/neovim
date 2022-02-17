local success, impatient = pcall(require, "impatient")
if not success then
    vim.notify("Unable to load impatient!")
    return
end

impatient.enable_profile()
