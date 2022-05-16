import { useEffect, useState } from "react";
import { Link } from "react-router-dom";

export default function Moods() {
    const [moods, setMoods] = useState([]);

    function getMoods() {
        fetch("/moods")
            .then((res) => res.json())
            .then((moods) => {
                console.log("moods----->", moods.rows);
                setMoods(moods.rows);
            })
            .catch((err) => {
                console.log(err);
            });
    }

    useEffect(() => {
        getMoods();
    }, []);

    return (
        <>
            <Link to="/">
                <p className="fontMoods">Get In the Mood</p>
            </Link>
            <div className="moods">
                {moods &&
                    moods.map((mood) => (
                        <Link to={`/pick-moods/${mood.id}`} key={mood.id}>
                            <div className="setMood">
                                <p className="textArea">{mood.mood}</p>
                            </div>
                        </Link>
                    ))}
            </div>
        </>
    );
}
