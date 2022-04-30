export default function Moods(props) {
    return (
        <>
            <div className="moods">
                {props.moods &&
                    props.moods.map((mood) => (
                        <div key={mood.id}>
                            <div
                                className="setMood"
                                onClick={() =>
                                    props.updateSelectedState(mood.id)
                                }
                            >
                                <p>{mood.name}</p>
                            </div>
                        </div>
                    ))}
            </div>
        </>
    );
}
