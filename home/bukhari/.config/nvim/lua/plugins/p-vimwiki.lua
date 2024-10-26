return {
	"vimwiki/vimwiki",
	config = function()
		vim.g.vimwiki_key_mappings = { all_maps = 0 }
		vim.cmd([[
          let g:vimwiki_list = [{'path': '~/Beauty/vimwiki/', 'path_html' : '~/Beauty/vimwiki_html'}]
	  let g:jukit_mappings = 0
	  set nocompatible
	  filetype plugin on
	  syntax on

          nmap <leader>ww :VimwikiTabIndex 1<CR>
          nmap <leader><CR> <Plug>VimwikiFollowLink
          vmap <leader><CR> <Plug>VimwikiFollowLink
          nmap <leader>wt <Plug>VimwikiToggleListItem
          nmap <Backspace> <Plug>VimwikiGoBackLink
        ]])
	end,
}
