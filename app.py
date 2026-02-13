from flask import Flask, request, render_template

app = Flask(__name__)

@app.route('/', methods=['GET', 'POST'])
def hello():
    who = "Whizlabs"
    if request.method == "POST":
        who = request.form.get("who", "Whizlabs")
    return render_template("index.html", who=who)

if __name__ == "__main__":
    app.run(debug=True)

