from flask import Flask, render_template_string, request

app = Flask(__name__)

# Simple poll options
poll_data = {
    "question": "What's your favorite DevOps tool?",
    "options": ["Terraform", "Ansible", "Docker", "Kubernetes"],
    "votes": [0, 0, 0, 0]
}

@app.route("/", methods=["GET", "POST"])
def poll():
    if request.method == "POST":
        vote = request.form.get("vote")
        if vote in poll_data["options"]:
            index = poll_data["options"].index(vote)
            poll_data["votes"][index] += 1

    return render_template_string("""
        <h2>{{ poll_data.question }}</h2>
        <form method="post">
            {% for option in poll_data.options %}
                <input type="radio" name="vote" value="{{ option }}"> {{ option }}<br>
            {% endfor %}
            <input type="submit" value="Vote">
        </form>
        <h3>Results:</h3>
        <ul>
        {% for option, votes in zip(poll_data.options, poll_data.votes) %}
            <li>{{ option }}: {{ votes }} votes</li>
        {% endfor %}
        </ul>
    """, poll_data=poll_data)
