local telescope_setup, telescope = pcall(require, "telescope")
if not telescope_setup then
    print("telescope failed")
    return
end


local actions_setup, actions = pcall(require, "telescope.actions")
if not actions_setup then
    print("telescope actions failed")
    return
end

-- there should be more stuff
