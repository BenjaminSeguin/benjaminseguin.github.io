# benjaminseguin.github.io

Personal academic website. Plain static HTML + one stylesheet — no build step,
no generator, no dependencies to install.

## Structure

```
index.html          Home: bio, research interests, selected publications
publications.html   Full list + BibTeX, grouped by year (math via KaTeX)
software.html       R packages
teaching.html       Course table (add a <tr> per course)
experience.html     CV timeline: appointments, education, industry, distinctions
css/style.css       All styling. Design tokens are at the top of the file.
assets/             Images (portrait)
files/              CV and paper PDFs
```

## Preview locally

```bash
python3 -m http.server 4321
```

Then open <http://localhost:4321>.

## Deploy to GitHub Pages

This is a *user site*, so the repository must be named exactly
`benjaminseguin.github.io` and the content must sit on the default branch.

```bash
gh repo create benjaminseguin.github.io --public --source=. --remote=origin --push
```

Pages turns on automatically for user sites; the site appears at
<https://benjaminseguin.github.io> within a minute or two. Afterwards, `git push`
is all it takes to publish a change.

## Editing notes

- **Design tokens** — colours, fonts, and the page width live in the `:root`
  block at the top of `css/style.css`. Change them there, not inline.
- **Dark mode** is the `@media (prefers-color-scheme:dark)` block at the very
  bottom of `css/style.css`. Delete that block for a light-only site.
- **Portrait** — `assets/portrait.jpg` is a 4:5 head-and-shoulders crop
  (480×600) of `assets/portrait-source.jpg`, kept uncropped so the crop can be
  redone. Crop box: `(0, 140, 592, 880)`. The slot is 230px wide on desktop,
  set by `--rail` in `css/style.css`.
- **Math** — write `$inline$` or `$$display$$`; KaTeX renders it on
  `publications.html`. To add math to another page, copy the three KaTeX tags
  from the `<head>` of `publications.html`.
- **Adding a publication** — copy an existing `<li class="item">` block. The
  `.item-year` div is the left column; everything else goes in the second div.
- The nav is duplicated in each HTML file; there are no partials. Update
  `.site-nav` in all five files when you add a page, and set
  `aria-current="page"` on the current one.

## Still to do

- [ ] Add Google Scholar / LinkedIn links (placeholders are commented out in `index.html`).
- [ ] Split `files/ncg-hb.pdf` into separate manuscript and M.Sc. thesis PDFs
      once the submitted paper diverges from the thesis.
- [ ] Confirm the `benjamin.seguin@dauphine.eu` address is the one to advertise
      after the move to Université Gustave Eiffel.
