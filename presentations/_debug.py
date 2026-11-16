import re, pathlib
t = pathlib.Path('basics_of_scripting.md').read_text(encoding='utf-8')
p = re.compile(
    r"^##\s+Slide\s+(\d+)\.\s+(.+?)$\s*"
    r"```slide(?::(\w+))?\s*\n(.*?)```\s*"
    r"(?:__Comment__:\s*(.*?))?(?=\n##\s+Slide|\Z)",
    re.M | re.S,
)
print('full matches:', len(p.findall(t)))
p2 = re.compile(
    r"^##\s+Slide\s+(\d+)\.\s+(.+?)$\s*"
    r"```slide(?::(\w+))?\s*\n(.*?)```",
    re.M | re.S,
)
print('no-comment matches:', len(p2.findall(t)))
# show first slide raw region
i = t.find('## Slide 1')
print(repr(t[i:i+120]))
